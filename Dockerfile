FROM tomcat:9.0.65-jdk11-temurin
RUN apt-get update && apt-get install -y maven git && \
    mkdir $CATALINA_HOME/build
WORKDIR $CATALINA_HOME/build
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && \
    git clone https://github.com/testgit4me/app.git && \
    rm boxfuse-sample-java-war-hello/src/main/webapp/index.jsp && \
    cp app/index.jsp boxfuse-sample-java-war-hello/src/main/webapp/index.jsp && \
    cd boxfuse-sample-java-war-hello && mvn package && \
    mv boxfuse-sample-java-war-hello/target/hello-1.0.war $CATALINA_HOME/webapps/hello-1.0.war

