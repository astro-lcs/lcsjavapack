FROM  centos:7.3.1611

RUN  yum install -y maven

COPY m2.tar.xz /tmp/
RUN cd /tmp/ && tar -Jxvf m2.tar.xz && mv m2 /root/.m2 && rm -rf m2.tar.xz


#ADD ./project /project
WORKDIR /project

#Time
ENV TW=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TW /etc/localtime && echo $TW > /etc/timezone

#RUN mvn clean

#CMD ["/bin/bash"]


CMD mvn package
