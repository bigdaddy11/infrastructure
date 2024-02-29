######################################################
#                    TOMCAT ENV                      #
######################################################
TOMCAT_NAME=container11
DATE=`date +'%Y%m%d_%H%M%S'`
OFFSET=100

export JAVA_HOME=/shcsw/jdk21

export CATALINA_HOME=/shcsw/tomcat
export CATALINA_BASE=$CATALINA_HOME/domains/$TOMCAT_NAME
export CATALINA_LOG=/logs/`hostname`/tomcat/$TOMCAT_NAME
export CATALINA_OUT=$CATALINA_LOG/catalina.out

######################################################
#                  JAVA OPTS ENV                     #
######################################################

export JAVA_OPTS="$JAVA_OPTS -Dserver.mode=tst"
export JAVA_OPTS="$JAVA_OPTS -Dserver.name=$TOMCAT_NAME"
export JAVA_OPTS="$JAVA_OPTS -Dserver.port=$(expr 8005 + $OFFSET)"
export JAVA_OPTS="$JAVA_OPTS -Dhttp.port=$(expr 8080 + $OFFSET)"
export JAVA_OPTS="$JAVA_OPTS -Dhttps.port=$(expr 8443 + $OFFSET)"
export JAVA_OPTS="$JAVA_OPTS -Dajp.port=$(expr 8009 + $OFFSET)"

export JAVA_OPTS="$JAVA_OPTS -Dcontents.base=/contents"
export JAVA_OPTS="$JAVA_OPTS -Ddoc.base=container"
export JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=EUC-KR"
export JAVA_OPTS="$JAVA_OPTS -Dlog.base=$CATALINA_LOG"
export JAVA_OPTS="$JAVA_OPTS -Dssl.path=$CATALINA_BASE/cert"

######################################################
#                     JVM GC ENV                     #
######################################################

export JAVA_OPTS="$JAVA_OPTS -XX:+UseG1GC"
export JAVA_OPTS="$JAVA_OPTS -XX:MaxGCPauseMillis=200"
export JAVA_OPTS="$JAVA_OPTS -XX:+UseStringDeduplication"

export JAVA_OPTS="$JAVA_OPTS -Xms256m"
export JAVA_OPTS="$JAVA_OPTS -Xmx256m"
export JAVA_OPTS="$JAVA_OPTS -XX:MetaspaceSize=64m"
export JAVA_OPTS="$JAVA_OPTS -XX:MaxMetaspaceSize=64m"

export JAVA_OPTS="$JAVA_OPTS -verbose:gc"
export JAVA_OPTS="$JAVA_OPTS -XX:+PrintGCDetails"
export JAVA_OPTS="$JAVA_OPTS -Xlog:gc*"
#export JAVA_OPTS="$JAVA_OPTS -XX:+PrintGCTimeStamps"
#export JAVA_OPTS="$JAVA_OPTS -XX:+PrintGCDateStamps"
#export JAVA_OPTS="$JAVA_OPTS -XX:+PrintHeapAtGC"
export JAVA_OPTS="$JAVA_OPTS -XX:+DisableExplicitGC"
export JAVA_OPTS="$JAVA_OPTS -Xloggc:$CATALINA_LOG/gclog/gc_$TOMCAT_NAME_$DATE.log"

export JAVA_OPTS="$JAVA_OPTS -XX:+HeapDumpOnOutOfMemoryError"
export JAVA_OPTS="$JAVA_OPTS -XX:HeapDumpPath=$CATALINA_LOG/dump"
