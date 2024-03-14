JSONS=$(curl -X GET http://127.0.0.1:8000/project/all)
echo "Received:"
echo $JSONS | jq > jsons.json
LENGTH=$(jq length jsons.json)
echo Length: $LENGTH
mkdir projects
for i in $(seq 0 $(($LENGTH-1))); do
    name=$(echo $JSONS | jq .[$i] | jq '.name' | tr -d '"' | tr -d ' ' | tr -d '\n' | tr -d ' ')
    echo $JSONS | jq .[$i] 0> projects/$name.json
done
