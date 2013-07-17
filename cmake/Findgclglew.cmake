SET(DepName "gclglew")
IF(${IS_GLEW_ENABLED})
	IF(${WIN32})
		SET(GLEW_ROOT "${CMAKE_CURRENT_LIST_DIR}")

		SET(GLEW_INCLUDE_DIR ${GLEW_ROOT}/include)

		FIND_LIBRARY(
  		GLEW_LIBRARY 
  		NAMES 
    		glew32s
  		PATHS
    		${GLEW_ROOT}/lib/${KINEVOX_ARCHITECTURE}
  		NO_DEFAULT_PATHS )
		add_definitions(-DGLEW_STATIC)
		SET(${DepName}_INCLUDE_DIR ${GLEW_INCLUDE_DIR} )
		list(APPEND ${DepName}_LIBS ${GLEW_LIBRARY} )
		#SET(glew_LIBS ${GLEW_LIBRARY} )
	ELSE()
		#FIND_PACKAGE(glew)
		SET(${DepName}_INCLUDE_DIR "/usr/include/GL")
		list(APPEND ${DepName}_LIBS "GLEW")
	ENDIF()

ENDIF()

