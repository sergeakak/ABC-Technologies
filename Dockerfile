FROM tomcat:latest
COPY /var/lib/jenkins/workspace/ABC-Technologies-CI/target/ABCtechnologies-1.0.war /usr/local/tomcat/webapps/
RUN sed -i 's/port="8080"/port="9090"/g' /usr/local/tomcat/conf/server.xml
EXPOSE 9090
CMD ["catalina.sh", "run"]


