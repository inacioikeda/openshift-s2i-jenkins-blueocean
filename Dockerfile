FROM registry.access.redhat.com/rhel7
MAINTAINER inacio.ikeda@fabricads.com.br

EXPOSE 8080

RUN yum -y install java-1.8.0-openjdk wget && \
    cd /etc/yum.repos.d/ && wget https://pkg.jenkins.io/redhat-stable/jenkins.repo && rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key \
    yum -y install jenkins && yum clean all
#    systemctl start jenkins && systemctl enable jenkins \
#    firewall-cmd --zone=public --add-port=8080/tcp --permanent \
#    firewall-cmd --zone=public --add-service=http --permanent \
#    firewall-cmd --reload \
#    echo "The admin password is: " && cat /var/lib/jenkins/secrets/initialAdminPassword

COPY .s2i/bin /usr/local/s2i

LABEL io.openshift.s2i.scripts-url=image///usr/local/s2i

RUN chown -R 1001:0 /opt/jenkins
USER 1001

CMD ["echo","Image S2i is done! Cabron"]
