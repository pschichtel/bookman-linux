Bookman Cockpit Linux Edition
=============================

Only the AUR package (linked at the bottom) is maintained, check that for up to date build information.

This is a small script that downloads the windows installer from their website, unpacks it, replaces the platform detection and start it up similar to how the `bookman.exe` would do on windows.

Dependencies
------------

Bookman's windows installer bundles these, but only for windows (obviously). This script expects them on the system.

For bookman:

* Java 17 (bookman bundles eclipse-temurin)
* OpenJFX 17 (jars expected in `$JAVA_HOME/lib`)

For the script:

* curl
* unzip

Packages
--------

* AUR: https://aur.archlinux.org/packages/bookman-cockpit

