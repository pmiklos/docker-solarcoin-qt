FROM	ubuntu:16.04

RUN	apt-get update -y

RUN     apt-get install -y curl

RUN     curl -SLO http://blockexplorer.solarcoin.org/downloads/SolarCoin_2.1.8_64bit.run \
	&& chmod 755 ./SolarCoin_2.1.8_64bit.run

RUN	apt-get install -y libgl1-mesa-glx libxcomposite1 libxslt1.1 libglib2.0-0 libxrender1 libgstreamer-plugins-base0.10-0

RUn	./SolarCoin_2.1.8_64bit.run

WORKDIR	SolarCoin_2.1.8_64bit

RUN	apt-get install -y libfreetype6 libfontconfig1 libice6 libsm6 libxi6

RUN	apt-get install -y dbus

RUN	groupadd --gid 1000 solarcoin \
	&& useradd --uid 1000 --gid solarcoin --shell /bin/bash --create-home solarcoin

USER	solarcoin
VOLUME	/home/solarcoin

CMD	["/bin/bash", "-c", "LD_LIBRARY_PATH=/SolarCoin_2.1.8_64bit/libs/ QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb ./solarcoin-qt"]
