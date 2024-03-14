JSONS=$(curl -sX GET http://127.0.0.1:8000/project/all)
echo $JSONS | jq > .jsons.json
LENGTH=$(jq length .jsons.json)
mkdir projects -p
for i in $(seq 0 $(($LENGTH-1))); do
    name=$(echo $JSONS | jq .[$i] | jq '.name' | tr -d '"' | tr -d ' ' | tr -d '\n')
    echo $JSONS | jq .[$i] 0> projects/$name.json
done
echo "Retrieved $LENGTH projects."
echo "Saved to projects/ directory."
rm .jsons.json
