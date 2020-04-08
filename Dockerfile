FROM centos
RUN yum install -y java
VOLUME /tmp
EXPOSE 8010
ADD ./target/HelloWorldMicroservice-1.0.0.jar demohelloworld.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/demohelloworld.jar"]
