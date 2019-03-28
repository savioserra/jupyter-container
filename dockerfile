FROM python:latest

RUN pip3 install jupyter && \
    pip3 install jupyterlab pandas matplotlib

EXPOSE 8888

RUN useradd -ms /bin/bash jupyter && \
    mkdir -p /home/jupyter/.jupyter/migrated && \
    chmod -R 777 /home/jupyter

USER jupyter
WORKDIR /home/jupyter

COPY jupyter/config/jupyter_notebook_config.py .jupyter/jupyter_notebook_config.py

CMD [ "jupyter", "lab", "--ip=0.0.0.0" ]