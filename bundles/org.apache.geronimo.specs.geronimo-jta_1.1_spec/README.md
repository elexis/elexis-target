This is a "fork" of the source code of <https://mvnrepository.com/artifact/org.apache.geronimo.specs/geronimo-jta_1.1_spec>
with some adaptations to mitigate <https://issues.apache.org/jira/browse/DBCP-571>

It differs from the original as follows:
* Removal of the Java package `javax.transaction.xa` in `/src` folder
* Removal of the resp. `Export-Package` entry, as not to interfere with `javax.transaction.xa` exported by the JRE
* Addition of `Bundle-RequiredExecutionEnvironment: JavaSE-17` 