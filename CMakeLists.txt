cmake_minimum_required(VERSION 3.23)
project(my_project)

# GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)



find_package(GTest REQUIRED)


add_executable(main src/main.cpp)
target_include_directories(main PUBLIC src/ )


add_executable(tests test/test_main.cpp )

target_include_directories( tests PUBLIC src )
target_include_directories( tests PUBLIC test )

target_link_libraries(tests GTest::GTest GTest::Main GTest::gmock GTest::gmock_main)
