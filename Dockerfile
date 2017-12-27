FROM ubuntu:trusty

MAINTAINER Leandro Di Tommaso <leandro.ditommaso@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

COPY ./entrypoint.sh /bin/
COPY ./Makefile /opt/
COPY ./fonts/Lato/*.ttf /usr/share/fonts/truetype/
COPY ./fonts/Open_Sans/*.ttf /usr/share/fonts/truetype/
COPY ./fonts/Roboto/*.ttf /usr/share/fonts/truetype/
COPY ./fonts/Source_Sans_Pro/*.ttf /usr/share/fonts/truetype/

RUN apt-get update -q && \
    apt-get install --no-install-recommends -qy \
                        gnuplot \
                        latex-xcolor \
                        lmodern \
                        luatex \
                        make \
                        python-pygments \
                        texlive-binaries \
                        texlive-fonts-recommended \
                        texlive-lang-spanish \
                        texlive-latex-base \
                        texlive-latex-extra \
                        texlive-luatex \
                        texlive-xetex \
                        xindy && \
    ln -s /usr/share/xindy/lang/spanish/modern-utf8-lang.xdy /usr/share/xindy/lang/spanish/utf8-lang.xdy && \
    ln -s /usr/share/xindy/lang/spanish/modern-utf8-test.xdy  /usr/share/xindy/lang/spanish/utf8-test.xdy && \
    ln -s /usr/share/xindy/lang/spanish/modern-utf8.xdy  /usr/share/xindy/lang/spanish/utf8.xdy && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    chmod +x /bin/entrypoint.sh && \
    apt-get install fontconfig && \
    /usr/bin/fc-cache -fv

WORKDIR /data
VOLUME ["/data"]
ENTRYPOINT ["/bin/entrypoint.sh"]
