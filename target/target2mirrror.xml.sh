#!/bin/bash
# prepare the lines for elexis.target.p2mirror.xml from the elexis.target file
# some manual assembly needed
grep repository elexis.target | sed 's/^[[:space:]]*//'
grep "<unit" elexis.target | sed 's/^[[:space:]]*//' | sed 's/^<unit*/<iu/' | sed '/feature.group/ {p; s/feature.group/source.feature.group/;}'