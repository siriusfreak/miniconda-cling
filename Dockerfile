FROM continuumio/miniconda3:latest

VOLUME  /opt/notebooks
VOLUME /home

# installing jupiterlab and jupiterhub
RUN /opt/conda/bin/conda install -c conda-forge jupyterlab
RUN /opt/conda/bin/conda install xeus-cling -c conda-forge
RUN /opt/conda/bin/conda install -c conda-forge mathjax
RUN /opt/conda/bin/conda install -c conda-forge jupyterhub

# installing nbview
RUN apt-get update
RUN apt-get install -y git libmemcached-dev libcurl4-openssl-dev pandoc libevent-dev libgnutls28-dev
WORKDIR /root
RUN git clone https://github.com/jupyter/nbviewer.git
WORKDIR /root/nbviewer
RUN pip install -r requirements.txt
RUN pip install -r requirements-dev.txt
RUN npm install
RUN invoke bower
RUN invoke less

# creating user
COPY ./create_users.sh /root/create_users.sh
RUN chmod u+x /root/create_users.sh
RUN /bin/bash /root/create_users.sh

# copy start script
COPY ./start.sh /root/start.sh
RUN chmod u+x /root/start.sh

ENTRYPOINT ["/bin/sh", "/root/start.sh" ]