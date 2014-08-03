SET(DepName "gclglew")
IF(${IS_GLEW_ENABLED})
    IF(${WIN32})
    	get_filename_component(GLEW_ROOT
                       "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/"
                       REALPATH)
    	add_definitions(-DGLEW_STATIC)
    	SET(${DepName}_INCLUDE_DIR ${GLEW_ROOT}/include )
    	list(APPEND ${DepName}_LIBS ${GLEW_ROOT}/lib/glew32s.lib )
	ELSE()
	   SET(${DepName}_INCLUDE_DIR "/usr/include/GL")
       list(APPEND ${DepName}_LIBS "GLEW")
	ENDIF()
ENDIF()

