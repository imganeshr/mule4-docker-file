FROM openjdk:8


# Define environment variables.
ENV BUILD_DATE=04072020
ENV MULE_HOME=/opt/mule
ENV MULE_VERSION=4.2.2

RUN mkdir mulezip
RUN ls -la
COPY mule-ee-distribution-standalone-4.2.2-hf1.zip /mulezip
RUN cd /mulezip && ls -la

RUN cd ../opt && unzip /mulezip/mule-ee-distribution-standalone-4.2.2-hf1.zip && ls -la
RUN ln -s /opt/mule-ee-distribution-standalone-4.2.2-hf1 ${MULE_HOME}

RUN chmod 777 ${MULE_HOME}/bin/mule
RUN chmod 777 ${MULE_HOME}/bin/launcher

VOLUME ["${MULE_HOME}/logs", "${MULE_HOME}/conf", "${MULE_HOME}/apps", "${MULE_HOME}/domains"]


CMD [ "/opt/mule/bin/mule"]

EXPOSE 9082


