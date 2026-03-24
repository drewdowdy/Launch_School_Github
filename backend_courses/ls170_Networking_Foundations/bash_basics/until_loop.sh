limit=10
counter=0

until [[ $counter -gt $limit ]]
do
  echo $counter
  ((counter++))
done