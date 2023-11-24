# Elexis Development and Production Target 2023-09-java17

### Updates

https://redmine.medelexis.ch/issues/23378
https://redmine.medelexis.ch/issues/22666
https://redmine.medelexis.ch/issues/25682 Jaxrs Consumer soll HTTP/2 unterstützen
https://redmine.medelexis.ch/issues/25687 com.eclipsesource.jaxrs.provider.gson.GsonProvider updates

* ch.elexis.core.jcifs -> move ?
* ch.elexis.core.pdfbox -> move?
* ch.elexis.fop_wrapper (elexis-3-base) -> move ?
* ch.elexis.core.logback.rocketchat -> move
* ch.elexis.core.serial -> move ?
* org.eclipse.nebula.widgets.gallery
* Remove commons-exec
* Replace com.ibm.icu SimpleDateFormat -> java.text
* SimpleDateFormat to DateTimeFormatter 
* Unify XML|JSON implementations: JAXB-RI, jackson (fasterxml), gson -> move to JAXB-RI (XML) and GSON (Json)
* Use https://github.com/MEDEVIT/osgi-jax-rs-connector/commits/5.4.0_osgi_only
* Swagger -> Update 1.5 to 1.6 -> JACKSON
	* at.medevit.elexis.documents.converter SWAGGER CLIENT
* JDBC 4.2 (ab Java 8)
	* Postgres
	* mysql-j
	* h2
	
	
* Ersatz com.eclipsesource.jaxrs.consumer mit https://eclipse-ee4j.github.io/jersey.github.io/apidocs/2.29.1/jersey/org/glassfish/jersey/client/proxy/package-summary.html

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

### p2 repo: Eclipse P2 artifacts (`eclipse-p2`)

* Modify `elexis.tpd`, then use Eclipse to build `elexis.target` out of it
* Generate `target2p2mirror.xml ` by running `ant/elexis-target target2p2mirror.xml.launch`
* Run `mvn tycho-eclipserun:eclipse-run` to build eclipse target derived p2 site into `target/$target-name/eclipse-p2` 

### p2 repo: Maven based artifacts (`maven-p2`)

* Update the requirements in `pom.xml`
* Run `mvn p2:site -U` to build maven derived p2 site into `target/$target-name/maven-p2`

#### p2 repo: Local artifacts (`elexis-p2`)

In order to add local bundles to the target, perform the following steps:

* Locate the new bundle in the `bundles` directory.
* In `bundles/info.elexis.target.repo` you find a temporary target to load (update it first) and update `feature.xml` against. 
* Now within your IDE export the feature into the target directory `target/$target-name/elexis-p2/`

### Uploading the target 

* Run `mvn resources:copy-resources` to copy the p2 information files from `template/` to `target/$target-name/`.
* Update `rsync.sh` to the current target location and run it.

### Docker usage

Only on x86_64 architecture

In `docker/` a docker build image can be built. This can be used like `docker run -it --rm --init -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven gitlab.medelexis.ch:4567/elexis/docker-build:2023-03-java17 xvfb-run mvn clean verify` 

To keep the state `mkdir m2` then
`docker run -it --rm  --init -v "$(pwd)":/usr/src/mymaven -v "$(pwd)/m2":/root/.m2 -w /usr/src/mymaven gitlab.medelexis.ch:4567/elexis/docker-build:2023-03-java17 xvfb-run mvn clean install`

this will populate a local m2 repository. 

#### Surefire Test Debugging

If required to debug a failing test, start with (after keeping the state)

`docker run -it --rm  --network host --init -v "$(pwd)":/usr/src/mymaven -v "$(pwd)/m2":/root/.m2 -w /usr/src/mymaven gitlab.medelexis.ch:4567/elexis/docker-build:2023-03-java17 xvfb-run mvn install -DdebugPort=8000 -rf :THE_TEST_PLUGIN`

you can the connect Eclipse using remote debugging, and if you modify the tests `pom.xml` to include

```
<artifactId>tycho-surefire-plugin</artifactId>
	<configuration>
	  <systemProperties>
		<osgi.console>7234</osgi.console>
	  </systemProperties>
          <dependencies>
    </configureation>
```

the OSGI console will be available at port 7234.

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