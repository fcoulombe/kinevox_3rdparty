
FIND_PACKAGE(gclzlib)
SET(DepName "gcllibpng")
get_filename_component(PNG_ROOT
                       "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/"
                       REALPATH)
        
SET(LPATH ${PNG_ROOT}/lib/)
		
IF(${WIN32})
    SET(PNG_LIBRARY ${LPATH}libpng16_static.lib)
ELSE()
    SET(PNG_LIBRARY ${LPATH}libpng.a)
ENDIF()
	
SET(${DepName}_INCLUDE_DIR ${PNG_ROOT}/include ${zlib_INCLUDE_DIR})
list(APPEND ${DepName}_LIBS ${gclzlib_LIBS} )
list(APPEND ${DepName}_LIBS ${PNG_LIBRARY})
#message("png!!!" ${${DepName}_INCLUDE_DIR})

