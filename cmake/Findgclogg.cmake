SET(DepName "gclogg")

get_filename_component(OGG_ROOT
                       "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/"
                       REALPATH)

SET(LPATH ${OGG_ROOT}/lib/)
if(${WIN32})
    SET(LIB_NAME "ogg")
else()
    SET(LIB_NAME "libogg")
endif()
	
SET(${DepName}_INCLUDE_DIR ${OGG_ROOT}/include)
list(APPEND ${DepName}_LIBS ${LPATH}${LIB_NAME}.a )
#message("ogg!!!" ${OGG_LIBRARY})

