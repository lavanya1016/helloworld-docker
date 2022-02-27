##build stage 

FROM maven:3.5.2-jdk-8 As build
COPY src ./mavenhello/src
COPY pom.xml ./mavenhello
RUN mvn -f ./mavenhello/pom.xml clean package

##package stage

FROM openjdk:11
EXPOSE 8080
COPY --from=build ./mavenhello/target/example.smallest-0.0.1-SNAPSHOT.war /usr/lib/example.smallest-0.0.1-SNAPSHOT.war
ENTRYPOINT ["java","-jar","/usr/lib/example.smallest-0.0.1-SNAPSHOT.war"]