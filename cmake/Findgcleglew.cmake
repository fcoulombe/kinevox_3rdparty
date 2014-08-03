SET(DepName "gcleglew")
IF(${IS_EGLEW_ENABLED})
		get_filename_component(EGLEW_ROOT
                       "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/"
                       REALPATH)
		
		SET(${DepName}_INCLUDE_DIR ${EGLEW_ROOT}/include )
		list(APPEND ${DepName}_LIBS ${EGLEW_ROOT}/lib/eglew.a )
		#message("eglew!!!" ${${DepName}_INCLUDE_DIR} )
ENDIF()

