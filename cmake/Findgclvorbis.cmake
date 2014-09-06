SET(DepName "gclvorbis")

get_filename_component(VORBIS_ROOT
                       "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/"
                       REALPATH)

SET(LPATH ${VORBIS_ROOT}/lib/)
	  
SET(${DepName}_INCLUDE_DIR ${VORBIS_ROOT}/include )

if (${WIN32})
    SET(LIB_SUFFIX ".lib")
else()
    SET(LIB_SUFFIX ".a")
endif()
list(APPEND ${DepName}_LIBS ${LPATH}libvorbis${LIB_SUFFIX})
list(APPEND ${DepName}_LIBS ${LPATH}libvorbisfile${LIB_SUFFIX})
if (NOT ${MSVC})
 	list(APPEND ${DepName}_LIBS "m")
ENDIF()

