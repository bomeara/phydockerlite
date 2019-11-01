FROM rocker/rstudio:latest

MAINTAINER Brian O'Meara <omeara.brian@gmail.com>

RUN apt-get update

RUN apt-get install -y apt-utils

RUN echo 'options(repos = c(CRAN="https://cran.rstudio.com"))' > ~/.Rprofile

RUN apt-get install -y software-properties-common

RUN apt-get -y install libx11-dev

RUN apt-get update

RUN apt-get -y install x11-common

RUN apt-get install -y libmpfr-dev libmpfr-doc

RUN apt-get install -y curl

RUN apt-get install libgl1-mesa-dev

RUN apt-get -y install python-dev

RUN Rscript -e "install.packages('ctv')"

RUN Rscript -e "install.packages('partitions')"

RUN Rscript -e "ctv::install.views('Phylogenetics')"

RUN Rscript -e "install.packages('diagram')"

RUN Rscript -e "devtools::install_github('bomeara/phrapl')"

RUN Rscript -e "devtools::install_github( 'heibl/ips')"

RUN Rscript -e "install.packages('drake')"
