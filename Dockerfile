# Create a minimal container to run the CSC command
FROM busybox
MAINTAINER Gorka Eguileor "geguileo@redhat.com"

COPY csc /bin

ENTRYPOINT ["csc"]
CMD ["--help"]
