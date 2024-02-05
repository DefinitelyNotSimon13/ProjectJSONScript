#! /bin/bash
#
FILE=project.json

usage() {
  echo "Usage function"
  exit 1
}
name=""
language=""
category=""
if [ ! -z "${@}" ]; 
then
  while getopts "n:l:c" o; do
    case $o in
      (n) name=$OPTARG;;
      (l) language=$OPTARG;;
      (c) category=$OPTARG;;
      (*) usage
    esac
  done
else
  echo "No arguments called, using default values."
fi

echo "${name}"
echo "${language}"
echo "${category}"

if [ -f $FILE ]; then
  echo "project.json already exists in this directory!"
  exit
fi
echo "Creating \"project.json\" in current directory..."
printf "\
{ \n \
  \"name\":  \"\",\n \
  \"description\": \"\",\n \
  \"language\": \"\",\n \
  \"version\": \"0.1.0\",\n \
  \"category\": \"\",\n \
}\
">>project.json
echo "\"project.json\" created in current directory!"
