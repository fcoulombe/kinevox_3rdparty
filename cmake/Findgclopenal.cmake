SET(DepName "gclopenal")

get_filename_component(OPENAL_ROOT
                       "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/"
                       REALPATH)

SET(LPATH ${OPENAL_ROOT}/lib/)
IF(${WIN32})
    SET(LIB_NAME "OpenAL32")
ELSE()
    SET(LIB_NAME "libopenal")
ENDIF()
 	
SET(${DepName}_INCLUDE_DIR "${OPENAL_ROOT}/include" )
list(APPEND ${DepName}_LIBS ${LPATH}${LIB_NAME}.so)
#message("openal!!!" ${OPENAL_INCLUDE_DIR})
#message("openal!!!" ${LPATH} ${LIB_NAME} ${OPENAL_LIBRARY})
