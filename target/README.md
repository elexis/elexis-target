# Elexis Development and Production Target 2021-06-java11

Current: `2021-09-java11` 

## About the target

### Versioning System

The target versioning system is based upon the Eclipse release used (e.g. `2021-06`) and the java version tested for (e.g. `java11`).

### Target / P2 site structure

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

* Update `pom.xml` base values like `target-name` etc to reflect the changes

### p2 repo: Eclipse P2 artifacts

* Modify `elexis.tpd`, than use Eclipse to build `elexis.target` out of it
* Generate `target2p2mirror.xml ` by running `ant/elexis-target target2p2mirror.xml.launch`
* Run `mvn tycho-eclipserun:eclipse-run` to build eclipse target derived p2 site into `target/$target-name/eclipse-p2` 

### p2 repo: Maven based artifacts

* Update the requirements in `pom.xml`
* Run `mvn p2:site -U` to build maven derived p2 site into `target/$target-name/maven-p2`

#### p2 repo: Local artifacts

In order to add local bundles to the target, perform the following steps:

* Locate the new bundle in the `bundles` directory.
* In `bundles/info.elexis.target.repo` you find a temporary target to load (update it first) and update `feature.xml` against. 
* Now within your IDE export the feature into the target directory `target/$target-name/elexis-p2/`

### Uploading the target 

* Run `mvn resources:copy-resources` to copy the p2 information files from `template/` to `target/$target-name/`.
* Update `rsync.sh` to the current target location and run it.

## Target Rules

* Eclipse Release leads new target, versioning oriented on Eclipse Release
* Orbit Recommended Repo for this Release is to be used
* Java is made available via Target (?) - LTS only
# Chromium?


## Using the generated target site

3. tpd -> target (https://github.com/hmarchadour/fr.obeo.releng.targetplatform/blob/78e0d470f57bfd82ba6fe7e1c09bfeb2fdfb0180/fr.obeo.releng.targetplatform-parent/targetdefinitions/pom.xml)
* Change file in elexis-3-core to only use all 

### Within Eclipse IDE (during development)

Load the target within `ide.target` to get your IDE set up. 


### Within Maven Build Process

https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html




# Notes / Open Topics / ToDos

* Export target does not work as expected, no entries are created for contents in maven_libs
* https://github.com/elexis/elexis-server-dependencies/blob/master/pom.xml
* https://javahacks.net/2014/10/08/adding-maven-artifacts-to-your-target-platform/
* https://wiki.eclipse.org/Equinox/p2/Ant_Tasks
* parallel generate-resources phase? (i.e. parallel p2 repo generation)
* Build own JRE update site using https://www.eclipse.org/justj/
* Script to update all bundles to Java-XX