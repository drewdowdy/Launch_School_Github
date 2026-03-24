require "pg"

class DatabasePersistence
  class InvalidTableError < StandardError; end

  ALLOWED_TABLES = [
      'eating_styles',
      'flavors',
      'responses',
      'toppings_responses',
      'toppings',
      'users'
    ]
  
  def initialize(db_name='survey')
    @db = PG.connect(dbname: db_name)
    setup_schema
  end

  def add_user(user_name)
    sql = "INSERT INTO users (name) VALUES ($1) RETURNING id;"
    result = @db.exec_params(sql, [user_name])

    result[0]['id'].to_i
  end

  def add_response(user_id, response_hsh)
    responses_sql = "INSERT INTO responses (user_id, brand, eating_style_id, flavor_id, poem) VALUES ($1, $2, $3, $4, $5) RETURNING id;"

    eating_style_id = get_eating_style_id(response_hsh[:eating_style])
    flavor_id = get_flavor_id(response_hsh[:flavor])

    result = @db.exec_params(responses_sql, [
      user_id,
      response_hsh[:brand],
      eating_style_id,
      flavor_id,
      response_hsh[:poem]
    ])

    response_id = result.first['id']

    topping_ids = response_hsh[:toppings].map do |topping|
      get_topping_id(topping).to_i
    end

    add_toppings_responses(response_id, topping_ids)
  end

  def add_toppings_responses(response_id, topping_ids)
    toppings_responses_sql = "INSERT INTO toppings_responses (response_id, topping_id) VALUES($1, $2);"

    topping_ids.each do |topping_id|
      @db.exec_params(toppings_responses_sql, [response_id, topping_id])
    end
  end

  def remove_newest_user(user_name)
    sql = <<~SQL
      DELETE FROM users
      WHERE name = $1
      AND creation_date = (
        SELECT max(creation_date)
        FROM users
        WHERE name = $1
      );
    SQL

    @db.exec_params(sql, [user_name])
  end

  # Query methods

  def get_user_from_id(user_id)
    sql = <<~SQL
      SELECT * FROM users
      WHERE id = $1
    SQL

    result = @db.exec_params(sql, [user_id])
    result.first
  end

  def get_user_from_name(user_name)
    sql = <<~SQL
      SELECT * FROM users
      WHERE name = $1
      ORDER BY creation_date DESC -- the most recent user of that name
      LIMIT 1;
    SQL

    result = @db.exec_params(sql, [user_name])
    result.first
  end

  def get_response(user_name)
    sql = <<~SQL
      SELECT r.* FROM responses AS r
      INNER JOIN users AS u ON u.id = r.user_id
      WHERE u.name = $1
      ORDER BY u.creation_date DESC -- the most recent user of that name
      LIMIT 1;
    SQL

    result = @db.exec_params(sql, [user_name])
    result.first
  end

  def get_toppings_response(user_name)
    sql = <<~SQL
      SELECT tr.* FROM toppings_responses AS tr
      INNER JOIN responses AS r ON r.id = tr.response_id
      INNER JOIN users AS u ON u.id = r.user_id
      WHERE u.name = $1;
    SQL

    result = @db.exec_params(sql, [user_name])
    result.map(&:to_h)
  end

  def get_eating_style_id(eating_style)
    sql = "SELECT id FROM eating_styles WHERE name = $1"
    result = @db.exec_params(sql, [eating_style])

    result.first['id']
  end

  def get_flavor_id(flavor)
    sql = "SELECT id FROM flavors WHERE name = $1"
    result = @db.exec_params(sql, [flavor])

    result.first['id']
  end

    def get_topping_id(topping)
    sql = "SELECT id FROM toppings WHERE name = $1"
    result = @db.exec_params(sql, [topping])

    result.first['id']
  end

  # Testing Methods

  def clean_test_data
    @db.exec('DELETE FROM users;')
    @db.exec('DELETE FROM responses;')
    @db.exec('DELETE FROM toppings_responses;')
  end

  private

  def setup_schema
    result = @db.exec <<~SQL
      SELECT COUNT(*) FROM information_schema.tables
      WHERE table_schema = 'public' AND table_name IN ('users', 'responses', 'toppings');
    SQL

    schema_path = File.join(File.dirname(__FILE__), '..', 'schema.sql')

    if result[0]['count'] == '0'
      if File.exist?(schema_path)
        schema = File.read(schema_path)
        @db.exec(schema)
        puts "Database schema created successfully!"
      else
        puts "Warning: schema.sql not found at #{schema_path}"
      end
    end
  end
end