
IF(${ES2})
if (${WIN32})
	SET(POWERVR_SDK_ROOT "C:\\Imagination\\PowerVR\\GraphicsSDK\\SDK_3.1\\Builds\\")
	SET(GL_INCLUDE ${POWERVR_SDK_ROOT}/Include/)
	
	IF(${KINEVOX_ARCHITECTURE} STREQUAL "32bit")
		SET(GL_LIBS_PATH  ${POWERVR_SDK_ROOT}Windows/x86_32/Lib)
	ELSEIF(${KINEVOX_ARCHITECTURE} STREQUAL "64bit")
		SET(GL_LIBS_PATH  ${POWERVR_SDK_ROOT}Windows/x86_64/Lib)
	ENDIF()
	SET(EGL_LIB ${GL_LIBS_PATH}/libEGL.lib)
	
	SET(GLES_LIB ${GL_LIBS_PATH}/libGLESv2.lib)

	SET(${DepName}_INCLUDE_DIR ${GL_INCLUDE} )

	list(APPEND ${DepName}_LIBS ${EGL_LIB})
	list(APPEND ${DepName}_LIBS ${GLES_LIB})
	
	list(APPEND ${DepName}_DLL ${GL_LIBS_PATH}/libEGL.dll)
	list(APPEND ${DepName}_DLL ${GL_LIBS_PATH}/libGLESv2.dll)
else()
    FIND_PACKAGE(gcleglew)

    SET(DepName "gclopengl")
    SET(${DepName}_INCLUDE_DIR "/usr/local/include" ${gcleglew_INCLUDE_DIR})
    
    list(APPEND ${DepName}_LIBS /usr/local/lib/libEGL.so)
    list(APPEND ${DepName}_LIBS /usr/local/lib/libGLESv2.so)

    #message(${DepName}_INCLUDE_DIR)
    list(APPEND ${DepName}_LIBS ${gcleglew_LIBS})
    
endif()
ELSEIF(${ES3})
	message("ES3")
ELSE()
	FIND_PACKAGE(OpenGL )
	FIND_PACKAGE(gclglew)
	SET(DepName "gclopengl")
	SET(${DepName}_ROOT "${PROJECT_SOURCE_DIR}/3rdParty/opengl/")
	SET(${DepName}_INCLUDE_DIR ${${DepName}_ROOT}/include ${gclglew_INCLUDE_DIR})
	
	
	SET(${DepName}_INCLUDE_DIR ${${DepName}_INCLUDE_DIR} )
	list(APPEND ${DepName}_LIBS ${OPENGL_gl_LIBRARY})
	list(APPEND ${DepName}_LIBS /usr/lib/xorg/modules/extensions/libglx.so)
	list(APPEND ${DepName}_LIBS ${gclglew_LIBS} )
	#message("opengl!!! " ${${DepName}_LIBS})
	#SET(${DepName}_LIBS ${OPENGL_gl_LIBRARY} ${OPENGL_glu_LIBRARY})
ENDIF()
