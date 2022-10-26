#!/usr/bin/env bash

installer_bin='installer.exe'
if ! [ -e "$installer_bin" ]
then
    cookies="$(mktemp)"
    curl -L --cookie-jar "$cookies" -o "$installer_bin" 'https://bit.ly/3eMJh3j'
fi

installer_output="$(mktemp -d)"
unzip "$installer_bin" -d "$installer_output"
mv -v "$installer_output/bin/lib/"* "$installer_output/bin/bookman-"*.jar jars
rm -Rf "$installer_output"
curl -L -o jars/install4j-runtime.jar 'https://maven.ej-technologies.com/repository/com/install4j/install4j-runtime/9.0.7/install4j-runtime-9.0.7.jar'

find override -type f -name '*.java' -exec javac '{}' \;

java \
    -Duser.home="$PWD/home" \
    -Dde.bookman.deployMode=LIVE \
    -Dde.bookman.javaBackendUri=https://cockpit.bookman-gmbh.de/api/java/ \
    -Dde.bookman.microsoftApplicationId=a7719d9a-1877-4bd1-a3c7-e3f8edf86485 \
    -Dde.bookman.microsoftSsoRedirectUrl=http://localhost:4826 \
    -cp 'override/:/usr/lib/jvm/java-17-openjdk/lib/*:jars/*' \
    de.bookman.start.MainGradle

