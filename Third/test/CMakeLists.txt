add_executable(main main.cpp)
# mainをコンパイルする際にgreetingsをリンクする
target_link_libraries(main greetings)