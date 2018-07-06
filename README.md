# CSC

Small and simple container with the [Container Storage Client](https://github.com/rexray/gocsi/tree/master/csc).

Resulting container image is less than 9MB.

CSC binary was compiled using the following command:

```
CGO_ENABLED=0 go build -a --installsuffix cgo --ldflags="-s" -o csc
```

Container tags will match the CSI Spec version the CSC command supports.

The container behaves as the CSC command, so any CMD we pass it will behave as if it was passed directly to the CSC command itself.

An example on how to use the CSC command:

```
docker run --rm akrog/csc identity plugin-info -e tcp://192.168.1.12:50051
```

If we want to run the CSC container as part of the Kubernetes pod where we have the CSI plugin, we should pass the CSI_ENDPOINT and replace the entrypoint and command with `tail` and `-f /dev/null` respectively in the manifest.  This will keep the container running so you can then use the `exec` command to run csc commands or jump into a shell.

Running commands from the shell (we don't need to provide then end point since we provided CSI_ENDPOINT):

```
docker exec $CONTAINER_NAME csc identity plugin-info
```
