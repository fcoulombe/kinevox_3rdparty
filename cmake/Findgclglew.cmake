SET(DepName "gclglew")
IF(${IS_GLEW_ENABLED})
    IF(${WIN32})
    	SET(GLEW_ROOT "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/")
    	SET(GLEW_INCLUDE_DIR ${GLEW_ROOT}/include)
    	FIND_LIBRARY(
     		GLEW_LIBRARY 
     		NAMES 
       		glew32s
     		PATHS
       		${GLEW_ROOT}/lib/
     		NO_DEFAULT_PATHS )
    	add_definitions(-DGLEW_STATIC)
    	SET(${DepName}_INCLUDE_DIR ${GLEW_INCLUDE_DIR} )
    	list(APPEND ${DepName}_LIBS ${GLEW_LIBRARY} )
	ELSE()
	   SET(${DepName}_INCLUDE_DIR "/usr/include/GL")
       list(APPEND ${DepName}_LIBS "GLEW")
	ENDIF()
ENDIF()

