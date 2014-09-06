SET(DepName "gclfreetype")
get_filename_component(FREETYPE_ROOT
                       "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/"
                       REALPATH)
SET(LPATH ${FREETYPE_ROOT}/lib/)
IF(${WIN32})
	SET(LIB_SUFFIX ".lib")
	SET(LIB_NAME "freetype")
ELSE()
	SET(LIB_SUFFIX ".a")
	SET(LIB_NAME "libfreetype")
ENDIF()

SET(${DepName}_INCLUDE_DIR ${FREETYPE_ROOT}/include )
list(APPEND ${DepName}_LIBS ${LPATH}${LIB_NAME}${LIB_SUFFIX})
#message("freetype!!!" ${LPATH} ${LIB_NAME} ${FREETYPE_LIBRARY})
