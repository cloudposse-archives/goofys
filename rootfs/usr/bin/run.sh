#!/bin/bash

syslog-ng -f /etc/syslog-ng/syslog-ng.conf

goofys -f --endpoint $ENDPOINT --region $REGION --stat-cache-ttl $STAT_CACHE_TTL --type-cache-ttl $TYPE_CACHE_TTL --dir-mode $DIR_MODE --file-mode $FILE_MODE -o nonempty $BUCKET $MOUNT_DIR
