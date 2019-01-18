#FROM openjdk:8-jdk-slim
#ENV PORT 8080
#ENV CLASSPATH /opt/lib
#EXPOSE 8080

# copy pom.xml and wildcards to avoid this command failing if there's no target/lib directory
#COPY pom.xml target/lib* /opt/lib/

# NOTE we assume there's only 1 jar in the target dir
# but at least this means we don't have to guess the name
# we could do with a better way to know the name - or to always create an app.jar or something
#COPY target/*.jar /opt/app.jar
#WORKDIR /opt
#CMD ["java", "-jar", "app.jar"]



FROM smartnimbus/was8.5.5.9-profile
ARG warfile=hello-world
COPY target/hello-world-war-*.war /tmp/hello-world.war
ENV PORT 9443
EXPOSE 9443
RUN wsadmin.sh -lang jython -conntype NONE -c "AdminApp.install('/tmp/$warfile.war', '[ -appname $warfile -contextroot /$warfile -MapWebModToVH [[ $warfile.war $warfile.war,WEB-INF/web.xml default_host]]]')"