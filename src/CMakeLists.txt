add_library(xml
    xml.cpp
)

target_include_directories(xml
    PUBLIC ${PROJECT_SOURCE_DIR}/include
)


#############
# Xerces C++
#############
# use pkg-config
find_package(PkgConfig REQUIRED)

if(PkgConfig_FOUND)
    pkg_check_modules(XcercesC xerces-c)

    
    include_directories(${XcercesC_INCLUDE_DIRS})
    target_link_libraries(xml ${XcercesC_LIBRARIES})
endif(PkgConfig_FOUND)