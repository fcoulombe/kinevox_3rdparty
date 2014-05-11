SET(DepName "gclogg")

SET(OGG_ROOT "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
SET(LPATH ${OGG_ROOT}/lib/)
if(${WIN32})
    SET(LIB_NAME "ogg")
else()
    SET(LIB_NAME "libogg")
endif()
	
SET(OGG_INCLUDE_DIR ${OGG_ROOT}/include)
FindLibrary(OGG_LIBRARY ${LIB_NAME} ${LPATH})
	
SET(${DepName}_INCLUDE_DIR ${OGG_INCLUDE_DIR} )
list(APPEND ${DepName}_LIBS ${OGG_LIBRARY} )
#message("ogg!!!" ${OGG_LIBRARY})

