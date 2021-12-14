#!/bin/bash
rsync -aiv --delete --dry-run -e ssh target/2021-09-java11 root@download.medelexis.ch:/mnt/deploy/download.elexis.info/elexis/target/
echo "==================="
echo "WAS DRY-RUN ONLY!"
echo "==================="
