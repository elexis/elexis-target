#!/bin/bash
rsync -aiv --delete -e ssh target/2021-03-java11 root@srv.elexis.info:/home/jenkins/downloads/elexis/target/ 
