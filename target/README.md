Export target does not work as expected, no entries
are created for contents in maven_libs


https://github.com/elexis/elexis-server-dependencies/blob/master/pom.xml
https://javahacks.net/2014/10/08/adding-maven-artifacts-to-your-target-platform/

https://wiki.eclipse.org/Equinox/p2/Ant_Tasks

## Versioning System

2021-03

## How to update the target

* Modify tpd
* Modify pom.xml
* Generate target file from tpd
* Run build.sh or commit

## Target Rules

* Eclipse Release leads new target, versioning oriented on Eclipse Release
* Orbit Recommended Repo for this Release is to be used
* Java is made available via Target (?) - LTS only
# Chromium?

## Generating a new target site

1. Define target version name in `pom.xml` - `properties / target-name`,  lead by Eclipse version (e.g. 2021-03)
2. Define p2 requirements in `elexis.tpd` 
	* Generate `elexis.target` by running `Created target definition file` in the IDE, or `tpd_to_target.launch`
3. Define maven repository inclusions in `pom.xml` in artifact `p2-maven-plugin`
4. Generate p2 site to `target/$target-name/` by running `mvn clean verify`
5. Copy the resulting target to its destination


## Using the generated target site

3. tpd -> target (https://github.com/hmarchadour/fr.obeo.releng.targetplatform/blob/78e0d470f57bfd82ba6fe7e1c09bfeb2fdfb0180/fr.obeo.releng.targetplatform-parent/targetdefinitions/pom.xml)
* Change file in elexis-3-core to only use all 

### Within Eclipse IDE (during development)


### Within Maven Build Process

https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html

### Maven commands

* `mvn tycho-eclipserun:eclipse-run` Build eclipse target derived p2 site into `target/$target-name/eclipse-p2`
* `mvn p2:site` Build maven derived p2 site into `target/$target-name/maven-p2`
* `mvn resources:copy-resources` Copy files from `template/*` to target p2 site and replace variables

# Questions

parallel generate-resources phase? (i.e. parallel p2 repo generation)

Build own JRE update site using https://www.eclipse.org/justj/

# TODO

* Script to update all bundles to Java-XX