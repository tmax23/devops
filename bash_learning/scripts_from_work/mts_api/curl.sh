#!/bin/sh

AT=$(curl --request POST -H "application/x-www-form-urlencoded" --data "grant_type=refresh_token&client_id=keIYhE2gjtxwnp7Afejeopl78PJTalhD4jYDEfabsM6umbuynyUHTKt@app.b2b.mts.ru&client_secret=I5FW0yRhVgtOUsbmxtIgsfSRJ5y1nr72M7xVvqjBJzWDH9Dv22yE9kwgWcTvIh69YwfFTB9i92JFKCV7wUPslFqsFk2jAg4pdPxkPeUwkPxaiBLnGWPn52qc46TRAeX6WV8YuQdVbGAC6vYr9P9sP1ZvPpiQ6O3dycVlvmMVEFrc6Avgs1HKCmlmmM35qweWdcUpWSiyAWvgVPtraqcL9c95FCcQwx4Dtl1ZWpaFutSJoNq80NYmFx11A&refresh_token=VWotpooYgRgumSXqrk1Z1lYN5MnvQ8x9jFztbmHJ3tz3ae7gxhmYSUbF2im9" https://login.mts.ru/amserver/oauth2/token |  jq -r '.access_token')
curl -X POST -H "Content-Type: text/xml" -H "SOAPAction:''" -H "Authorization: Bearer $AT" --data @/home/linuser/mts_api/balance_req https://login.mts.ru:443/wss/api-manager/PublicApi/Sandbox/ICustomerManagementService/v1 | grep -oP '(?<=<balance>).*?(?=</balance>)' \
| sed 's/^<remainedAmount amount=\"//g; s/" unitOfMeasure="Российский рубль"\/>//g' \
| awk -F. '{print $1,"RUB"}' | ts '[%d-%m-%Y %H:%M:%S]'
