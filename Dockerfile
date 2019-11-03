FROM rocker/rstudio:latest

MAINTAINER Brian O'Meara <omeara.brian@gmail.com>

RUN apt-get update

RUN apt-get install -y apt-utils

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libxss1 \
    libxt6 \
    libxext6 \
    libsm6 \
    libice6 \
    xdg-utils \
    libxml2-dev \
    xorg \
    libx11-dev \
    libglu1-mesa-dev \
    libfreetype6-dev \
    libmagick++-dev \
  && rm -rf /var/lib/apt/lists/*

RUN echo 'options(repos = c(CRAN="https://cran.rstudio.com"))' > ~/.Rprofile

RUN apt-get update

RUN apt-get -y install x11-common

RUN apt-get install -y libmpfr-dev libmpfr-doc

RUN apt-get install -y curl

RUN apt-get install -y libgl1-mesa-dev

RUN apt-get -y install python-dev

RUN Rscript -e "install.packages('devtools')"


RUN Rscript -e "install.packages('data.table')"

RUN Rscript -e "install.packages('ctv')"

RUN Rscript -e "install.packages('partitions')"

RUN Rscript -e "install.packages('diagram')"

RUN Rscript -e "ctv::install.views('Phylogenetics')"

RUN Rscript -e "devtools::install_github('bomeara/phrapl')"

RUN Rscript -e "devtools::install_github( 'heibl/ips')"

RUN Rscript -e "install.packages('drake')"
