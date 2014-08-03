SET(DepName "gclfreetype")
get_filename_component(FREETYPE_ROOT
                       "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/"
                       REALPATH)
SET(LPATH ${FREETYPE_ROOT}/lib/)
SET(LIB_NAME "libfreetype")

SET(${DepName}_INCLUDE_DIR ${FREETYPE_ROOT}/include )
list(APPEND ${DepName}_LIBS ${LPATH}${LIB_NAME}.a)
#message("freetype!!!" ${LPATH} ${LIB_NAME} ${FREETYPE_LIBRARY})
