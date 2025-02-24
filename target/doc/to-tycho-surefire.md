# Probleme

* Application wird teils nicht gesetzt
* Nicht alle bundles die im Runlevel gesetzt sind kommen auch wirklich rein. vgl. ch.elexis.core.model test hatte partout ch.elexis.core.test.context nicht übernommen?


* Export des target.features -> binary jars ohne class files -> wenn ein projekt mit gleichem namen geöffnet ist, scheint er die class files von dort kopieren zu wollen, und wenn es keine hat - dann gibts keine! Lösung Projekt schliessen, oder anderer namen