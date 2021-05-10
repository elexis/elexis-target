# Elexis Development and Production Target 2021-03-java11

Current: `2021-03-java11`

## Notes / Open Topics

Export target does not work as expected, no entries
are created for contents in maven_libs


https://github.com/elexis/elexis-server-dependencies/blob/master/pom.xml
https://javahacks.net/2014/10/08/adding-maven-artifacts-to-your-target-platform/

https://wiki.eclipse.org/Equinox/p2/Ant_Tasks

## Versioning System

The target versioning system is based upon the Eclipse release used (e.g. `2021-03`) and the java version tested for (e.g. `java11`).
The current target is `2021-03-java11`.

## Target / P2 site structure

The target is distributed as a [p2](https://www.eclipse.org/equinox/p2/) repository. It is built out of 4 different sources.  Each of these sources is built into a p2 repository, they are together served as a [composite repository](https://wiki.eclipse.org/Equinox/p2/Composite_Repositories_(new). The resulting structure is as follows:


	compositeArtifacts.xml	
	compositeContent.xml
	p2.index					
	eclipse-p2/				Contains the Eclipse p2 based artifacts
	elexis-p2/				Contains the local (i.e. Elexis) artifacts
	maven-p2/				Contains the Maven based artifacts
	../justj.11				Contains the Java JRE

## How to update the target

Target development is done within the Eclipse IDE. That is, the target is prepared (developed and tested) within
the local development environment, and finally uploaded to the server for public usage.

### p2 repo: Local artifacts

Located in `bundles` directory. Generate a bundle for each project. In `info.elexis.target.repo` you find
a temporary target to load and update `feature.xml` against. Now within your IDE export the feature into
the target directory 

TODO `/Users/marco/git/elexis-target/target/target/2021-03-java11/elexis-p2`

### p2 repo: Eclipse P2 artifacts

Sourced via `elexis.tpd` -> `elexis.target` 
 
* Modify pom.xml
* Generate target file from tpd
* Run build.sh or commit

### p2 repo: Maven based artifacts



### Uploading the target 



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

* `mvn tycho-eclipserun:eclipse-run` Build eclipse target derived p2 site into `target/$target-name/eclipse-p2` (Be sure to run `ant/elexis-target target2p2mirror.xml.launch` to update the required `elexis.target.p2mirror.xml` file)
* `mvn p2:site -U` Build maven derived p2 site into `target/$target-name/maven-p2`
* `mvn resources:copy-resources` Copy files from `template/*` to target p2 site and replace variables

# Questions

parallel generate-resources phase? (i.e. parallel p2 repo generation)

Build own JRE update site using https://www.eclipse.org/justj/

# TODO

* Script to update all bundles to Java-XX