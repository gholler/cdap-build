#!/usr/bin/env bash
export MAVEN_OPTS="-Xmx3072m"
mvn clean install -P examples,spark1-dev,spark2-dev,templates,dist,release,tgz,unit-tests \
 -Drat.skip -Dcheckstyle.skip -Dmaven.javadoc.skip -DskipTests -Dgpg.skip \
 -Dadditional.artifacts.dir=$(pwd)/app-artifacts $*
