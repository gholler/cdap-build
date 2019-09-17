#
# Copyright © 2016-2018 Cask Data, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.

FROM openjdk:8-jdk AS run
WORKDIR /opt/cdap/ui
COPY cdap/cdap-master/target/stage-packaging/opt/cdap/master /opt/cdap/master
COPY cdap/cdap-ui/target/stage-packaging/opt/cdap/ui /opt/cdap/ui
COPY cdap/cdap-distributions/src/etc/cdap/conf.dist/logback*.xml /opt/cdap/master/conf/

ENV CLASSPATH=/etc/cdap/conf:/etc/cdap/security:/etc/hadoop/conf
ENV SPARK_COMPAT=spark2_2.11
ENV HBASE_VERSION=1.2
ENTRYPOINT ["bin/node", "index.js"]
