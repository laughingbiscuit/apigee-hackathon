
if [ -z "$API_HOST" ]; then echo "Enter the API Hostname" && read API_HOST; fi
if [ -z "$CLIENT_ID" ]; then echo "Enter the Client ID" && read CLIENT_ID; fi
if [ -z "$CLIENT_SECRET" ]; then echo "Enter the Client Secret" && read CLIENT_SECRET; fi

API_HOST=$API_HOST CLIENT_ID=$CLIENT_ID CLIENT_SECRET=$CLIENT_SECRET npx cucumber-js -- $ARGS
