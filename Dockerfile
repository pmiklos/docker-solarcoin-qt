FROM	ubuntu:16.04

RUN	apt-get update -y && apt-get install -y \
		curl \
		dbus \
		libfontconfig1 \
		libfreetype6 \
		libgl1-mesa-glx \
		libglib2.0-0 \
		libgstreamer-plugins-base0.10-0 \
		libice6 \
		libsm6 \
		libxcomposite1 \
		libxi6 \
		libxrender1 \
		libxslt1.1

ENV	SOLARCOIN_VERSION 2.1.8_64bit

RUN     curl -SLO http://blockexplorer.solarcoin.org/downloads/SolarCoin_$SOLARCOIN_VERSION.run \
	&& /bin/sh SolarCoin_$SOLARCOIN_VERSION.run --check \
	&& /bin/sh SolarCoin_$SOLARCOIN_VERSION.run --nox11 --noexec --target /opt/solarcoin \
	&& rm SolarCoin_$SOLARCOIN_VERSION.run

RUN	groupadd --gid 1000 solarcoin \
	&& useradd --uid 1000 --gid solarcoin --shell /bin/bash --create-home solarcoin

USER	solarcoin
VOLUME	/home/solarcoin
WORKDIR	/home/solarcoin

ENV	LD_LIBRARY_PATH=/opt/solarcoin/libs
ENV	QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

CMD	["/opt/solarcoin/solarcoin-qt"]
