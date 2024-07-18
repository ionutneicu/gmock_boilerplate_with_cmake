FROM debian:12-slim
RUN apt-get update
RUN apt-get -y install cmake build-essential libgtest-dev libgmock-dev
RUN mkdir project
WORKDIR project
RUN pwd
RUN mkdir build_gtest
WORKDIR ./build_gtest
RUN pwd
RUN cmake /usr/src/googletest 
RUN make
RUN make install
RUN cat /usr/local/lib/cmake/GTest/GTestTargets.cmake
WORKDIR ..
RUN mkdir build_project
ADD src build_project/src
ADD test build_project/test
COPY CMakeLists.txt build_project
WORKDIR build_project
RUN mkdir build
WORKDIR ./build
RUN pwd
RUN cmake ..
RUN make
RUN ./tests
