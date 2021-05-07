cmake_minimum_required(VERSION 2.8)
project(test_cmake CXX)
# DBUILD_SHARED_LIBSの ON OFF により静的ライブラリー、共有ライブラリーでビルドするかを決める
add_library(greetings hello.cpp good_morning.cpp)
# a.outという実行ファイルをmain.cppから作成
add_executable(a.out main.cpp)
# a.outを作成する際に libgreetings.a or libgreetings.so をリンク
target_link_libraries(a.out greetings)