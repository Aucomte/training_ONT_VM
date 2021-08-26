# An example of extension of the jupyter stack 'datascience-notebook'
# with pip modules ('pip install ...') and their system dependancies ('apt-get install -y ...')
FROM jupyter/datascience-notebook
USER root
RUN apt-get update
RUN apt-get install -y python3-pyqt5 pyqt5-dev-tools qttools5-dev-tools
RUN pip install PyQt5 ete3 owlready2 pyproteinsExt ipympl jupyterlab


#Adding dedicated kernel
RUN pip install bash_kernel
RUN python3 -m bash_kernel.install

#Install for non-specific ONT 
RUN apt-get install -y unzip seqtk wget build-essential cmake git-all tar gzip

#Dedicated install to ONT analyses, packed
RUN apt-get install -y minimap2 sniffles seqtk assemblytics bandage

RUN conda install -c bioconda raven-assembler
RUN conda install -c bioconda survivor
RUN conda install -c bioconda ragtag
RUN conda install -c bioconda flye
RUN conda install -c bioconda mummer 
RUN conda install -c bioconda racon 
RUN conda install -c bioconda assembly-stats 
RUN conda install -c bioconda nanoplot
RUN conda install -c bioconda medaka=1.4.1 -n medaka
RUN conda install -c bioconda quast=5.0.2 -n quast
RUN conda install -c bioconda blobtools -n blobtools

RUN pip install NanoComp
