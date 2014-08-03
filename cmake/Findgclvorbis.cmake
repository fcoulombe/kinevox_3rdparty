SET(DepName "gclvorbis")

get_filename_component(VORBIS_ROOT
                       "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/"
                       REALPATH)

SET(LPATH ${VORBIS_ROOT}/lib/)
	  
SET(${DepName}_INCLUDE_DIR ${VORBIS_ROOT}/include )
list(APPEND ${DepName}_LIBS ${LPATH}libvorbis.a)
list(APPEND ${DepName}_LIBS ${LPATH}libvorbisfile.a)
if (NOT ${MSVC})
 	list(APPEND ${DepName}_LIBS "m")
ENDIF()

