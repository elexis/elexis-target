#!/bin/bash
rsync -aiv --delete -e ssh target/2021-09-java11 root@download.medelexis.ch:/mnt/deploy/download.elexis.info/elexis/target/
