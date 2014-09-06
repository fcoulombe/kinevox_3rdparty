SET(DepName "gclzlib")

get_filename_component(ZLIB_ROOT
                       "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/"
                       REALPATH)

SET(LPATH ${ZLIB_ROOT}/lib/)
if(${WIN32})
    SET(LIB_SUFFIX ".lib")
    SET(LIB_NAME "zlibstatic")
elseif(${ANDROID})
    SET(LIB_NAME "libzlibstatic")
    SET(LIB_SUFFIX ".a")
ELSE()
    SET(LIB_NAME "libz")
ENDIF()

SET(${DepName}_INCLUDE_DIR  ${ZLIB_ROOT}/include)
list(APPEND ${DepName}_LIBS ${LPATH}${LIB_NAME}${LIB_SUFFIX})

