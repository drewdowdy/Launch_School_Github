greeting() {
  echo Hello $1   # no double quotes
  echo "Hello $1" # interpolated into double quotes
}

another_greeting() {
  echo Hello $1 and $2 # no double quotes
  echo "Hello $1"      # interpolated into double quotes
  echo "And hello $2"
}

greeting 'Peter'
another_greeting 'Paul' 'Paulina'