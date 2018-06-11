
# memory settings
JAVA_OPTS="$JAVA_OPTS -Xms{{min_heap_size}} -Xmx{{max_heap_size}}"
# dump settings
JAVA_OPTS="$JAVA_OPTS -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath={{app_directory}}/{{app_name}}{{heap_dump_dir}}"
# gc settings
JAVA_OPTS="$JAVA_OPTS -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled"
JAVA_OPTS="$JAVA_OPTS -XX:+PrintGCDetails -XX:+PrintGCDateStamps -verbose:gc -Xloggc:{{app_directory}}/{{app_name}}{{gc_log_file}}"
JAVA_OPTS="$JAVA_OPTS -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=7 -XX:GCLogFileSize=10M"
{% if ipv6_disable %}
# ipv6 disabled
JAVA_OPTS="$JAVA_OPTS -Djava.net.preferIPv4Stack=true"
{% endif %}

# JMX settings
#export CATALINA_OPTS="-Dcom.sun.management.jmxremote=true
#                      -Dcom.sun.management.jmxremote.ssl=false
#                      -Dcom.sun.management.jmxremote.authenticate=false
#                      -Djava.rmi.server.hostname=`hostname`"
