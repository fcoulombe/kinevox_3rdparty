SET(DepName "gclopenal")

get_filename_component(OPENAL_ROOT
                       "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/"
                       REALPATH)

SET(LPATH ${OPENAL_ROOT}/lib/)
IF(${WIN32})
    SET(LIB_SUFFIX ".lib")
    SET(LIB_NAME "OpenAL32")
    SET(${DepName}_INCLUDE_DIR "${OPENAL_ROOT}/include/AL" )
elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Android")
    SET(LIB_SUFFIX ".a")
    SET(LIB_NAME "libopenal")
    SET(${DepName}_INCLUDE_DIR "${OPENAL_ROOT}/include" )
    list(APPEND ${DepName}_LIBS OpenSLES)
    
ELSE()
    SET(LIB_SUFFIX ".so")
    SET(LIB_NAME "libopenal")
    SET(${DepName}_INCLUDE_DIR "${OPENAL_ROOT}/include" )
ENDIF()
 	
list(APPEND ${DepName}_LIBS ${LPATH}${LIB_NAME}${LIB_SUFFIX})
#message("openal!!!" ${OPENAL_INCLUDE_DIR})
#message("openal!!!" ${LPATH} ${LIB_NAME} ${OPENAL_LIBRARY})
