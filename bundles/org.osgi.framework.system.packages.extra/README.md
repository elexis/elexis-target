
# OSGi Extender Fragment


This fragment provides the `com.source.tree`,`com.source.util` and `sun.misc` to the OSGI container,
for resolving the bundles during Tycho build, resp.
Eclipse feature bundling.

At runtime, these packages are resolved by `org.eclipse.osgi`.

See https://github.com/eclipse-ee4j/jaxb-api/issues/92 and
https://bugs.eclipse.org/bugs/show_bug.cgi?id=540426

Also see https://stackoverflow.com/questions/32628098/unable-to-satisfy-dependency-from-com-lmax-disruptor-3-2-0-to-package-sun-misc-0/33379935#33379935