FROM debian:10-slim
RUN apt-get update
RUN apt-get -y install cmake build-essential pkg-config git
RUN mkdir project
WORKDIR project
RUN mkdir build_gtest
WORKDIR ./build_gtest
RUN git clone https://github.com/google/googletest.git
WORKDIR ./googletest
RUN git checkout tags/v1.15.0
WORKDIR ..
RUN cmake googletest 
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
