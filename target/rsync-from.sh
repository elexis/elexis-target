#!/bin/bash
rsync -aiv  --delete -e ssh root@download.medelexis.ch:/mnt/deploy/download.elexis.info/elexis/target/2023-09-java21 target/2023-09-java21
