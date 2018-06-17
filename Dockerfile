FROM ubuntu:16.04

RUN mkdir OS12step
WORKDIR /OS12step
ADD ./build/ /OS12step/
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y build-essential
RUN apt-get install -y wget
RUN apt-get install -y unzip

RUN cd /OS12step/binutils-2.19.1 ; ./configure --target=h8300-elf --disable-nls --disable-werror ; make ; make install

RUN sed -i -e 's/redir_handle = open (redir, O_WRONLY | O_TRUNC | O_CREAT)/redir_handle = open (redir, O_WRONLY | O_TRUNC | O_CREAT, 0755)/' /OS12step/gcc-3.4.6/gcc/collect2.c
RUN cp /OS12step/64bit.patch /OS12step/gcc-3.4.6/gcc/config/h8300/
RUN cd /OS12step/gcc-3.4.6/gcc/config/h8300 ; patch < 64bit.patch
RUN cd /OS12step/gcc-3.4.6 ; ./configure --target=h8300-elf --disable-nls --disable-threads --disable-shared --enable-languages=c ; make ; make install

RUN cd PackageFiles/src ; make ; chmod +x kz_h8write
