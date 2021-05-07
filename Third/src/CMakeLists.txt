option(GREETINGS_BUILD_SHARED_LIBS "build greetings as a shared library" OFF)
if(GREETINGS_BUILD_SHARED_LIBS)
    add_library(greetings
            SHARED
            hello.cpp good_morning.cpp)
else()
    add_library(greetings
            STATIC
            hello.cpp good_morning.cpp)
endif()
# greetingライブラリのインクルードディレクトリを教えてあげる
# PROJECT_SOURCE_DIRはこのプロジェクトのルートディレクトリの絶対パス
target_include_directories(greetings
  PUBLIC ${PROJECT_SOURCE_DIR}/include
)
