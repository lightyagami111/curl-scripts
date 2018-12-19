URL="http://stackoverflow.com/"

# store the whole response with the status at the and
HTTP_RESPONSE=$(curl --silent --write-out "HTTPSTATUS:%{http_code}" -X POST $URL)

# extract the body
HTTP_BODY=$(echo $HTTP_RESPONSE | sed -e 's/HTTPSTATUS\:.*//g')

# extract the status
HTTP_STATUS=$(echo $HTTP_RESPONSE | tr -d '\n' | sed -e 's/.*HTTPSTATUS://')

# print the body
echo "$HTTP_BODY"

# example using the status
if [ ! $HTTP_STATUS -eq 200  ]; then
  echo "Error [HTTP status: $HTTP_STATUS]"
  exit 1
fi