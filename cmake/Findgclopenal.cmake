SET(DepName "gclopenal")

SET(OPENAL_ROOT "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
SET(LPATH ${OPENAL_ROOT}/lib/)
SET(LIB_NAME "OpenAL32")
	
FIND_PATH(OPENAL_INCLUDE_DIR al.h
	PATHS "${OPENAL_ROOT}/include"
	"${OPENAL_ROOT}/include/AL")
FindLibrary(OPENAL_LIBRARY ${LIB_NAME} ${LPATH})
 	
SET(${DepName}_INCLUDE_DIR ${OPENAL_INCLUDE_DIR} )
list(APPEND ${DepName}_LIBS ${OPENAL_LIBRARY})
#message("openal!!!" ${OPENAL_INCLUDE_DIR})
#message("openal!!!" ${LPATH} ${LIB_NAME} ${OPENAL_LIBRARY})
