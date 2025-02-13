#!/bin/bash
rsync -aiv --delete -e ssh target/2025-03-java21 root@download.medelexis.ch:/mnt/deploy/download.elexis.info/elexis/target/
