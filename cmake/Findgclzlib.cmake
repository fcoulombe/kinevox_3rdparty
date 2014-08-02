SET(DepName "gclzlib")

SET(ZLIB_ROOT "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
SET(LPATH ${ZLIB_ROOT}/lib/)
if(${WIN32})
    SET(LIB_NAME "zlibstatic")
ELSE()
    SET(LIB_NAME "libz")
ENDIF()

SET(${DepName}_INCLUDE_DIR  ${ZLIB_ROOT}/include)
list(APPEND ${DepName}_LIBS ${LPATH}${LIB_NAME}.a)

