
FIND_PACKAGE(gclzlib)
SET(DepName "gcllibpng")
SET(PNG_ROOT "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
SET(LPATH ${PNG_ROOT}/lib/)


FIND_PATH(
	  PNG_INCLUDE_DIR png.h
	  PATHS ${PNG_ROOT}/include)
		
FindLibrary(PNG_LIBRARY libpng16_static ${LPATH})
	
SET(${DepName}_INCLUDE_DIR ${PNG_INCLUDE_DIR} ${zlib_INCLUDE_DIR})
list(APPEND ${DepName}_LIBS ${gclzlib_LIBS} )
list(APPEND ${DepName}_LIBS ${PNG_LIBRARY})
#message("png!!!" ${${DepName}_INCLUDE_DIR})

