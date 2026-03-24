string='Hello'

if [[ -n $string ]]
then
  echo $string
fi

integer_1=10
integer_2=10

if [[ $integer_1 -eq $integer_2 ]]
then
  echo $integer_1 and $integer_2 are the same!
fi

if [[ -e ./hello_world.sh ]]
then
  echo 'File exists'
fi

# Multiple Conditions

integer=4

if [[ $integer -lt 10 ]]
then
  echo $integer is less than 10
  if [[ $integer -lt 5 ]]
  then
    echo $integer is less than 5
  fi
fi

# Branching Conditions

integer=11

if [[ $integer -lt 10 ]]
then
  echo $integer is less than 10
else
  echo $integer is not less than 10
fi

# Three Conditional Branches

integer=15

if [[ $integer -lt 10 ]]
then
  echo $integer is less than 10
elif [[ $integer -gt 20 ]]
then
  echo $integer is greater than 20
else
  echo $integer is between 10 and 20
fi

# Two Conditions w/ &&

integer=18

if [[ $integer -gt 10 ]] && [[ $integer -lt 20 ]]
then
  echo $integer is between 10 and 20
fi

# One of two conditions w/ ||

integer=4

if [[ $integer -lt 5 ]] || [[ $integer -gt 10 ]]
then
  echo $integer is less than 5 or greater than 10
fi

# Negative conditions w/ !

integer=8

if [[ ! ($integer -lt 5 || $integer -gt 10) ]]
then
  echo $integer is between 5 and 10
fi