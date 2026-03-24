limit=10
counter=0

while [[ $counter -lt $limit ]]
do
  echo $counter
  ((counter++))
done