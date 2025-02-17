# Adapted fork of dbpc2 with modifications

This is a "fork" of the source code of <https://mvnrepository.com/artifact/org.apache.commons/commons-dbcp2/2.13.0>
with some adaptations to mitigate <https://issues.apache.org/jira/browse/DBCP-571>

It differs from the original as follows:
* Version set to `2.13.100`
* Removal of `Import-Package: javax.transaction.xa;mandatory:=partial;partial=true;version=1.1.0,`
* Addition of `Bundle-RequiredExecutionEnvironment: JavaSE-21` 
* package-info.java remove single line to fix build error
* Replace `javax.transaction` imports with `jakarta.transaction` imports

The package `javax.transaction.xa` is included in the JRE, while the adapted `org.apache.geronimo.specs.geronimo-jta_1.1_spec` satisfies the requirement for `javax.transaction`