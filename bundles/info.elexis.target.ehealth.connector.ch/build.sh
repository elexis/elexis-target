#!/bin/bash
mvn clean verify
cp -v target/ehealth.connector.ch-1.7.0.jar ../info.elexis.target.repo/ehealth-connector/

