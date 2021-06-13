ARG BASE_CONTAINER=jupyter/minimal-notebook
FROM $BASE_CONTAINER
LABEL author="Schoch Pascal"
USER root
WORKDIR /usr/src/app
# Copy app
COPY . .
RUN pip install pandas numpy matplotlib plotly
# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

# Docker Run Command
EXPOSE 8888
CMD [ "jupyter", "ApiCall.ipynb" ]
