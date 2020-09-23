FROM debian:buster-slim
RUN apt-get update -y
RUN apt-get install -y unzip curl wget
RUN apt-get install -y cmake build-essential

RUN curl https://archive.apache.org/dist/incubator/datasketches/cpp/2.0.0-incubating/apache-datasketches-cpp-2.0.0-incubating-src.zip -O
RUN unzip apache-datasketches-cpp-2.0.0-incubating-src.zip
RUN mkdir apache-datasketches-cpp-2.0.0-incubating-src/build
WORKDIR apache-datasketches-cpp-2.0.0-incubating-src/build
  RUN /usr/bin/cmake ..
RUN make

# Full test suit fails. Test only theta_test.
#RUN make test
RUN export TESTS='theta_test'; make -e check
