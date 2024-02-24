#FROM base_crac:21.0.1.crac-zulu
FROM ubuntu:24.04

RUN apt-get update
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get -qq -y install curl wget unzip zip

# Precisa executar como root. Caso contrário, não consegue fazer o snapshot
#USER ubuntu

RUN curl -s "https://get.sdkman.io" | bash
RUN chmod a+x "$HOME/.sdkman/bin/sdkman-init.sh"
RUN source "$HOME/.sdkman/bin/sdkman-init.sh"

ADD target/demo-crac-0.0.1-SNAPSHOT.jar /home/ubuntu/demo.jar

WORKDIR /home/ubuntu
RUN chmod +x demo.jar

CMD ["/bin/bash"]
