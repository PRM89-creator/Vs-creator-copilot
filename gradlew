#!/bin/sh

# ------------------------------------------------------------------------------
# Gradle startup script for Unix-based systems
# ------------------------------------------------------------------------------
APP_NAME="gradlew"
APP_BASE_NAME=$(basename "$0")

# Resolve the location of the script
PRG="$0"
while [ -h "$PRG" ]; do
  ls=$(ls -ld "$PRG")
  link=$(expr "$ls" : '.*-> \(.*\)$')
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=$(dirname "$PRG")/"$link"
  fi
done

SAVED="`pwd`"
cd "`dirname \"$PRG\"`/" >/dev/null
APP_HOME="`pwd -P`"
cd "$SAVED" >/dev/null

# Set Java command
if [ -n "$JAVA_HOME" ] ; then
  JAVA_CMD="$JAVA_HOME/bin/java"
else
  JAVA_CMD="java"
fi

# Execute Gradle Wrapper JAR
exec "$JAVA_CMD" -classpath "$APP_HOME/gradle/wrapper/gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain "$@"
