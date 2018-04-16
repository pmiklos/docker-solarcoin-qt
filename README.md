# docker-solarcoin-qt

This docker image is to run the SolarCoin QT wallet in a docker container. This image is to make it easy and possible to run the it on newer systems that have dependencies not compatible with the wallet.

## Usage

### Building a new image

To create a docker image run the docker build command as below

```console
$ docker build -t solarcoin-qt .
```

### Running the wallet

The solarcion-qt wallet is a GUI application and requires an X11 server to display. A startup script is provided that makes it easy to connect the wallet running inside the container to the X11 server of the host operating system. This way the wallet appears as a native GUI application.

```console
$ ./solarcoin-qt.sh
```

The script creates a temporary container with a name `solarcoin-qt` and sets up a named volume called `solarcoin-qt-data` to store the wallet configuration and database. Once the user closes the wallet the docker container is destroyed but the data will be persisted in the named volume so consequtive executions of the script will load the wallet data into the new container.

## Donate

Donations are welcome to the Solarcoin address below:

SLR: `8SLEtCnnXem2yYVSLS2UChwrpTNso7AxE9`

