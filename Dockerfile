FROM continuumio/miniconda3:latest

VOLUME  /opt/notebooks
RUN /opt/conda/bin/conda install jupyter -y --quiet
RUN /opt/conda/bin/conda install xeus-cling -c conda-forge
RUN /opt/conda/bin/conda install -c conda-forge mathjax
RUN apt-get update

RUN mkdir  /root/.jupyter
COPY jupyter_notebook_config.json /root/.jupyter

ENTRYPOINT /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser --allow-root
