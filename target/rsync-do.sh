#!/bin/bash
rsync -aiv --delete -e ssh target/2022-09-java17 root@download.medelexis.ch:/mnt/deploy/download.elexis.info/elexis/target/
