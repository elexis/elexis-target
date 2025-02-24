# Service stacks

Elexis consumes several external services, with each having a specific stack of dependencies and
configuration required to run. This document describes this stacks.

Default run levels https://github.com/eclipse-pde/eclipse.pde/blob/5c22faed563dcb4feaae633c96a84642f38bc0fb/ui/org.eclipse.pde.ui/src/org/eclipse/pde/internal/ui/editor/product/PluginConfigurationSection.java#L135

## Combined Runlevel configuration

| **Start Level** | **Auto Start** | **Bundle**                              |
|-----------------|----------------|-----------------------------------------|
| 1               | True           | org.eclipse.equinox.event               |		
| 1               | True           | org.apache.felix.scr                    |
| 1               | True           | org.apache.aries.spifly.dynamic.bundle  |
| 2               | True           | ch.qos.logback.classic                  |
| 2               | True           | org.glassfish.jersey.core.jersey-common |
| 2               | True           | org.glassfish.jersey.core.jersey-client |
| 3               | True           | ch.elexis.core.jpa.datasource           |

## Basics

* `org.apache.felix.scr`
* `org.eclipse.equinox.event`

## SPI Fly

The [SPI Fly](https://aries.apache.org/documentation/modules/spi-fly.html) component is aimed at providing OSGi support for JRE SPI mechanisms, including the usage of java.util.ServiceLoader, META-INF/services and similar methods.

* `org.apache.aries.spifly.dynamic.bundle`
* `org.objectweb.asm`

## SLF4J Logging

**SPIFLY REQ** 

* `slf4j-api` ?
* `slf4j-osgi` ?
* `ch.qos.logback.classic` Implementation
* `ch.qos.logback.core`
* `jul.to.slf4j`
* `jcl.over.slf4j`
* `org.apache.commons.logging`
* `org.apache.logging.log4j.api`
* `org.jbos.logging.jboss-logging`

## JAXB Java XML Binding (https://github.com/jakartaee/jaxb-api)

**SPIFLY REQ** 

* `jakarta.xml.bind-api`
* `com.xun.xml-bind.jaxb-osgi`

See demo project https://github.com/col-panic/os-development-spifly-demo to demonstrate proper setup.

## JAXRS JAX-RS (Java API for RESTful Web Services) (https://github.com/jakartaee/rest) 


* patched `jakarta.ws.rs-api`
* patched `jersey-client`
* patched `jersey-common`

## JAXWS JAX-WS(Java API for XML Web Services) (https://github.com/jakartaee/jax-ws-api)



## MAIL

--> spifly not required?

* `jakarta.activation-api` requires `jakarta.activation.spi.MailcapRegistryProvider`
* `angus-activation` provides `jakarta.activation.spi.MailcapRegistryProvider` via 
* `org.eclipse.angus.jakarta.mail` repackages `jakarta.mail-api` and provides mail implementation
* `jakarta.mail-api` NOT NEEDED - TRUE
* `com.sun.mail.jakarta.mail` REMOVE

* https://stackoverflow.com/questions/21856211/javax-activation-unsupporteddatatypeexception-no-object-dch-for-mime-type-multi

## Persistence

EclipseLink https://eclipse.dev/eclipselink/

* `jakarta.persistence-api`
* `org.eclipse.persistence.core`
* `org.eclipse.persistence.asm`
* `org.eclipse.persistence.extension`
* `org.eclipse.persistence.jpa`
* `org.eclipse.persistence.jpa.jpql`
* `ch.elexis.core.jpa.datasource`
* `ch.elexis.core.jpa.entities`
* `ch.elexis.core.jpa.logging.slf4j`
* + DB JDBC drivers (mysql, ...)
* `dbcp` -> jakarta.transaction

## Jetty Server

In addition to the **Combined Runlevel configuration** 

| **Start Level** | **Auto Start** | **Bundle**                              |
|-----------------|----------------|-----------------------------------------|
| 3               | True           | org.eclipse.jetty.ee10.annotations      |		
| 2               | True           | org.eclipse.jetty.ee10.osgi.boot        |
| 2               | True           | org.eclipse.jetty.osgi                  |

in order to enable a bundle to contribute, `META-INF/MANIFEST.MF` must contain the entries `Jetty-Environment: ee10` and `Web-ContextPath: /.`

Remove `org.eclipse.equinox.http.service_api` and `org.eclipse.equinox.http.servlet`

`org.eclipse.equinox.http.jetty` would also boot jetty

#### Jetty Paramaters

```
-Dorg.osgi.service.http.port=8380
-Djetty.http.port=8380
-Djetty.home.bundle=org.eclipse.jetty.ee10.osgi.boot
-Dorg.eclipse.jetty.LEVEL=DEBUG
```

## Common problems

* `Provider for jakarta.ws.rs.ext.RuntimeDelegate cannot be found` jersey-common, jersey-client