FROM olegkunitsyn/gnucobol:3.1-dev

ADD  ./src/ /src

ADD ./tests/ /tests

RUN cd /src && cobc -lxml2 -x -free -o cobolator ./cbl/main.cobol ./cbl/configuration/*.cobol

ENV LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH

ENTRYPOINT ["/src/cobolator", "/tests/basic-configuration.txt" ]
