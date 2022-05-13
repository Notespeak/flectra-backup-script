#!/bin/bash
set -e
BK_FORMAT=zip
#you need to change the URL, PWD, DB lines below
URL="http(s)://YourFLECTRAurl/web/database/backup"
PWD='YourMasterPassword'
DB='YourDBname'
bcdir=/path/to/something/

DATE=$(date +"%Y%m%d%H%M")
if [ ! -d $bcdir ]; then
    mkdir -p $bcdir
fi

echo "Backing up DB: $FL_DB   Date:$DATE"
FORM="-F master_pwd={PWD} -F name=${DB} -F backup_format=${BK_FORMAT}"

curl -s -X POST ${FORM} -o $bcdir/$DB-$DATE.$BK_FORMAT $URL

echo "Done."
