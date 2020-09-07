FROM continuumio/miniconda
ADD environment.yml .
RUN conda env create -f environment.yml
WORKDIR /root/code
RUN apt update
RUN apt install -y build-essential
RUN apt install -y cmake
RUN git clone --recursive -j8 git://github.com/hjwdzh/Manifold
WORKDIR /root/code/Manifold/build
RUN cmake .. -DCMAKE_BUILD_TYPE=Release
RUN make
RUN apt install vim -y
WORKDIR /root
RUN echo 'conda activate point2mesh' >> .bashrc
