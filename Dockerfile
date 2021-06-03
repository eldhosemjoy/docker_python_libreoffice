FROM python:3.8
RUN python -V
RUN python -m pip install --upgrade pip

#Installing LibreOffice_7.1.3 Dependencies
RUN apt-get update
RUN apt-get install -y default-jre libxinerama1 libdbus-1-dev libcups2-dev libx11-xcb-dev

#Installing LibreOffice_7.1.3
WORKDIR /soffice
# COPY LibreOffice_7.1.3_Linux_x86-64_deb.tar.gz /soffice
RUN wget https://mirrors.estointernet.in/tdf/libreoffice/stable/7.1.3/deb/x86_64/LibreOffice_7.1.3_Linux_x86-64_deb.tar.gz
RUN tar -xvf LibreOffice_7.1.3_Linux_x86-64_deb.tar.gz
RUN dpkg -i LibreOffice_7.1.3.2_Linux_x86-64_deb/DEBS/*.deb

#Configuring SOFFICE client for terminal operations
# RUN echo 'alias soffice="/opt/libreoffice7.1/program/soffice"' >> ~/.bashrc
RUN ln -s /opt/libreoffice7.1/program/soffice /usr/local/bin/soffice
RUN ln -s /opt/libreoffice7.1/program/soffice /usr/local/bin/lowriter

#docker build --rm -f Dockerfile -t python_libreoffice:3.8_7.1.3 . --no-cache