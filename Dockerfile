FROM ubuntu:16.04

RUN mkdir OS12step ; cd OS12step

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y build-essential
RUN apt-get install -y wget
RUN apt-get install -y unzip

RUN wget http://kozos.jp/books/makeos/gcc-3.4.6.tar.gz
RUN wget http://kozos.jp/books/makeos/binutils-2.19.1.tar.gz
RUN tar xvzf gcc-3.4.6.tar.gz
RUN tar xvzf binutils-2.19.1.tar.gz

RUN cd binutils-2.19.1
RUN ./configure --target=h8300-elf --disable-nls --disable-werror
RUN make
RUN make install

RUN cd /OS12step/gcc-3.4.6
RUN sed -i -e 's/redir_handle = open (redir, O_WRONLY | O_TRUNC | O_CREAT)/redir_handle = open (redir, O_WRONLY | O_TRUNC | O_CREAT, 0755)/' gcc/collect2.c
ADD 64bit.patch /OS12step/gcc-3.4.6/gcc/config/h8300/
RUN cd gcc/config/h8300 ; patch < 64bit.patch
RUN cd /OS12step/gcc-3.4.6
RUN ./configure --target=h8300-elf --disable-nls --disable-threads --disable-shared --enable-languages=c
RUN make
RUN make install

RUN cd /OS12step
RUN wget "https://ja.osdn.net/frs/redir.php?m=ymu&f=kz-h8write%2F57645%2Fkz_h8write-v0.2.1.zip"
RUN mv 'redir.php?m=iij&f=kz-h8write%2F57645%2Fkz_h8write-v0.2.1.zip' kz_h8write.zip
RUN unzip kz_h8write.zip
RUN cd PackageFiles/src
RUN make
RUN chmod +x kz_h8write
