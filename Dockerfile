FROM olegkunitsyn/gnucobol:3.1-dev

ADD  src/ /src

RUN cd /src && cobc -free -x -o cobolator-exe ./cbl/main.cobol

ENV LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH

ENTRYPOINT "/src/cobolator-exe"
