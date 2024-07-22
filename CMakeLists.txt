cmake_minimum_required(VERSION 3.13)
project(my_project)

# GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)



find_package(PkgConfig REQUIRED)
pkg_check_modules(GMOCK REQUIRED gmock)
pkg_check_modules(GMOCK_MAIN REQUIRED gmock_main)
pkg_check_modules(GTEST REQUIRED gtest)
pkg_check_modules(GTEST_MAIN REQUIRED gtest_main)


add_executable(main src/main.cpp)
target_include_directories(main PUBLIC src/ )


add_executable(tests test/test_main.cpp )

target_include_directories( tests PUBLIC src )
target_include_directories( tests PUBLIC test )

target_link_libraries(tests ${GMOCK_LIBRARIES} ${GTEST_LIBRARIES} ${GMOCK_MAIN_LIBRARIES} ${GTEST_MAIN_LIBRARIES}) 
