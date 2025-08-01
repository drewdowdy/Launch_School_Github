ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require "fileutils" # module with tools for Files and Paths

require_relative '../cms.rb'

class CMSTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path)
    FileUtils.mkdir_p(version_path)
  end

  def teardown
    FileUtils.rm_rf(data_path)
    FileUtils.rm_rf(version_path)
  end

  def create_document(name, content = "")
    File.open(File.join(data_path, name), "w") do |file|
      file.write(content)
    end
  end

  def session
    last_request.env["rack.session"]
  end

  def admin_session
    { "rack.session" => { username: "admin" } }
  end

  def test_index
    create_document "about.md"
    create_document "changes.txt"

    get "/"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"
  end

  def test_view_file
    create_document 'history.txt', '1993 - Yukihiro Matsumoto dreams up Ruby.'

    get '/history.txt'

    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, '1993 - Yukihiro Matsumoto dreams up Ruby.'
  end

  def test_document_not_found
    get "/notafile.ext"

    assert_equal 302, last_response.status
    assert_equal "notafile.ext does not exist.", session[:message]
  end

  def test_viewing_markdown_document
    create_document 'about.md', "# Ruby is...\n\nA dynamic and open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural and easy to write."
    
    get "/about.md"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<h1>Ruby is...</h1>"
  end

  def test_editing_document
    create_document "changes.txt"

    get "/changes.txt/edit", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<textarea"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_editing_document_signed_out
    create_document "changes.txt"

    get "/changes.txt/edit"

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_updating_document
    create_document "changes.txt", "original content"

    post "/changes.txt", {content: "new content"}, admin_session

    assert_equal 302, last_response.status
    assert_equal "changes.txt has been updated.", session[:message]

    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"
  end

  def test_updating_document_signed_out
    post "/changes.txt", {content: "new content"}

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_view_new_document_form
    get "/new_doc", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_view_new_document_form_signed_out
    get "/new_doc"

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_create_new_document
    post "/new_doc", {file_name: "test.txt"}, admin_session
    assert_equal 302, last_response.status
    assert_equal "test.txt was created.", session[:message]

    get "/"
    assert_includes last_response.body, "test.txt"
  end

  def test_create_new_document_signed_out
    post "/new_doc", {file_name: "test.txt"}

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_create_new_document_without_filename
    post "/new_doc", {file_name: ""}, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, "A name is required"
  end

  def test_deleting_document
    create_document("test.txt")

    post "/test.txt/delete", {}, admin_session
    assert_equal 302, last_response.status
    assert_equal "test.txt has been deleted.", session[:message]

    get "/"
    refute_includes last_response.body, %q(href="/test.txt")
  end

  def test_deleting_document_signed_out
    create_document("test.txt")

    post "/test.txt/delete"
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_signin_form
    get "/users/signin"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_signin
    post "/users/signin", username: "admin", password: "secret"
    assert_equal 302, last_response.status
    assert_equal "Welcome!", session[:message]
    assert_equal "admin", session[:username]

    get last_response["Location"]
    assert_includes last_response.body, "Signed in as admin"
  end

  def test_signin_with_bad_credentials
    post "/users/signin", username: "guest", password: "shhhh"
    assert_equal 422, last_response.status
    assert_nil session[:username]
    assert_includes last_response.body, "Invalid credentials"
  end

  def test_signout
    get "/", {}, {"rack.session" => { username: "admin" } }
    assert_includes last_response.body, "Signed in as admin"

    post "/users/signout"
    assert_equal "You have been signed out.", session[:message]

    get last_response["Location"]
    assert_nil session[:username]
    assert_includes last_response.body, "Sign In"
  end

  # Validate that document names contain an extension that the application supports.
  def test_extension_name
    post "/new_doc", {file_name: "test.txt"}, admin_session
    assert_equal 302, last_response.status
    assert_equal "test.txt was created.", session[:message]

    post "/new_doc", {file_name: "test.md"}, admin_session
    assert_equal 302, last_response.status
    assert_equal "test.md was created.", session[:message]
    
    post "/new_doc", {file_name: "test"}, admin_session
    assert_equal 422, last_response.status
    # assert_equal "File extensions must be .txt or .md.", session[:message]
    assert_includes last_response.body, "File extensions must be .txt or .md."
  end

  # Add a "duplicate" button that creates a new document based on an old one.
  def test_dupliate_button
    create_document "test.txt", "This is some text."
    post "/duplicate", {existing_file_name: "test.txt"}, admin_session
    
    assert_equal "test.txt has been duplicated.", session[:message]
    assert_equal true, File.exist?(File.join(data_path, "test_copy.txt"))

    post "/duplicate", {existing_file_name: "test.txt"}
    assert_equal true, File.exist?(File.join(data_path, "test_copy_2.txt"))

    test_copy_content = File.read(File.join(data_path, "test_copy.txt"))
    test_copy_2_content = File.read(File.join(data_path, "test_copy_2.txt"))

    assert_includes test_copy_content, "This is some text."
    assert_includes test_copy_2_content, "This is some text."
  end

  # Extend this project with a user signup form.
  def test_user_signup
    get "/users/signup"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "<p>Create a new username and password to login with.</p>"

    post "users/signup", {username: "admin", password: ""}
    assert_equal 422, last_response.status
    assert_includes last_response.body, "Username is already taken. Choose a new one."

    post "users/signup", {username: "henry", password: "henryspassword"}
    assert_equal 302, last_response.status
    assert_equal "You have successfully signed up.", session[:message]
  end

  # Add the ability to upload images to the CMS.
  def test_upload_image
    image_path = File.join(__dir__, "JPG_Test.jpg")
    uploaded_file = Rack::Test::UploadedFile.new(image_path, "image/jpeg")

    post "/new_image", {image_upload: uploaded_file}, admin_session
    assert_equal 302, last_response.status
    assert_equal "Image was successfully uploaded.", session[:message]

    post "/new_image", {image_upload: nil}
    assert_equal 422, last_response.status
    assert_includes last_response.body, "No image was uploaded."
  end

  # Modify the CMS so that each version of a document is preserved as changes are made to it.
  def test_file_versions
    create_document("test.txt", "Original version content")

    post "/test.txt", {file_name: "test.txt", content: "New version content"}, admin_session
    assert_equal 302, last_response.status
    assert_equal "test.txt has been updated.", session[:message]

    version_1_path = File.join(version_path, "test_version_1.txt")
    original_path = File.join(data_path, "test.txt")
    file_exists = File.exist?(version_1_path)

    assert_equal true, file_exists
    assert_includes "Original version content", File.read(version_1_path)
    assert_includes "New version content", File.read(original_path)
  end
end
