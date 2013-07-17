SET(DepName "gclcollada")
IF(False) #${IS_MSVC})
	SET(COLLADA_ROOT "${CMAKE_CURRENT_LIST_DIR}//binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
	
	SET(COLLADA_INCLUDE_DIR ${COLLADA_ROOT}/include/COLLADABaseUtils)
	SET(COLLADA_INCLUDE_DIR ${COLLADA_INCLUDE_DIR} ${COLLADA_ROOT}/include/COLLADAFramework)
	SET(COLLADA_INCLUDE_DIR ${COLLADA_INCLUDE_DIR} ${COLLADA_ROOT}/include/COLLADASaxFrameworkLoader)
	
	
	SET(COLLADA_DEBUG_LIBRARY debug ${COLLADA_ROOT}/lib/${KINEVOX_ARCHITECTURE}/COLLADABaseUtils_d.lib)
	SET(COLLADA_DEBUG_LIBRARY ${COLLADA_DEBUG_LIBRARY} debug ${COLLADA_ROOT}/lib/${KINEVOX_ARCHITECTURE}/COLLADAFramework_d.lib)
	SET(COLLADA_DEBUG_LIBRARY ${COLLADA_DEBUG_LIBRARY} debug ${COLLADA_ROOT}/lib/${KINEVOX_ARCHITECTURE}/COLLADASaxFrameworkLoader_d.lib)
	SET(COLLADA_DEBUG_LIBRARY ${COLLADA_DEBUG_LIBRARY} debug ${COLLADA_ROOT}/lib/${KINEVOX_ARCHITECTURE}/GeneratedSaxParser_d.lib)
	SET(COLLADA_DEBUG_LIBRARY ${COLLADA_DEBUG_LIBRARY} debug ${COLLADA_ROOT}/lib/${KINEVOX_ARCHITECTURE}/LibXML_d.lib)
	SET(COLLADA_DEBUG_LIBRARY ${COLLADA_DEBUG_LIBRARY} debug ${COLLADA_ROOT}/lib/${KINEVOX_ARCHITECTURE}/MathMLSolver_d.lib)
	SET(COLLADA_DEBUG_LIBRARY ${COLLADA_DEBUG_LIBRARY} debug ${COLLADA_ROOT}/lib/${KINEVOX_ARCHITECTURE}/pcre_d.lib)
	
	SET(COLLADA_LIBRARY optimized ${COLLADA_ROOT}/lib/${KINEVOX_ARCHITECTURE}/COLLADABaseUtils.lib)
	SET(COLLADA_LIBRARY ${COLLADA_LIBRARY} optimized ${COLLADA_ROOT}/lib/${KINEVOX_ARCHITECTURE}/COLLADAFramework.lib)
	SET(COLLADA_LIBRARY ${COLLADA_LIBRARY} optimized ${COLLADA_ROOT}/lib/${KINEVOX_ARCHITECTURE}/COLLADASaxFrameworkLoader.lib)
	SET(COLLADA_LIBRARY ${COLLADA_LIBRARY} optimized ${COLLADA_ROOT}/lib/${KINEVOX_ARCHITECTURE}/GeneratedSaxParser.lib)
	SET(COLLADA_LIBRARY ${COLLADA_LIBRARY} optimized ${COLLADA_ROOT}/lib/${KINEVOX_ARCHITECTURE}/LibXML.lib)
	SET(COLLADA_LIBRARY ${COLLADA_LIBRARY} optimized ${COLLADA_ROOT}/lib/${KINEVOX_ARCHITECTURE}/MathMLSolver.lib)
	SET(COLLADA_LIBRARY ${COLLADA_LIBRARY} optimized ${COLLADA_ROOT}/lib/${KINEVOX_ARCHITECTURE}/pcre.lib)
	
	SET(${DepName}_INCLUDE_DIR ${COLLADA_INCLUDE_DIR} )
	list(APPEND ${DepName}_LIBS ${COLLADA_LIBRARY} )
	list(APPEND ${DepName}_LIBS ${COLLADA_DEBUG_LIBRARY} )
	
ELSE()
	
	SET(COLLADA_ROOT "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")

	find_path(COLLADA_BASE_INCLUDE_DIR COLLADABU.h
	 PATHS
	  ${COLLADA_ROOT}/include/opencollada/COLLADABaseUtils
	  ${COLLADA_SYS_ROOT}/include/opencollada/COLLADABaseUtils
	  )
	find_path(COLLADA_FRAMEWORK_INCLUDE_DIR COLLADAFW.h
	  PATHS
	  ${COLLADA_ROOT}/include/opencollada/COLLADAFramework
	  ${COLLADA_SYS_ROOT}/include/opencollada/COLLADAFramework
	  )
	find_path(COLLADA_SAXFRAMEWORKLOADER_INCLUDE_DIR COLLADASaxFWLLoader.h
	  PATHS
	  ${COLLADA_ROOT}/include/opencollada/COLLADASaxFrameworkLoader
	  ${COLLADA_SYS_ROOT}/include/opencollada/COLLADASaxFrameworkLoader
	  )
	
	 SET(${DepName}_INCLUDE_DIR ${COLLADA_BASE_INCLUDE_DIR} ${COLLADA_FRAMEWORK_INCLUDE_DIR} ${COLLADA_SAXFRAMEWORKLOADER_INCLUDE_DIR} )
	 
	 find_library(COLLADA_LIBRARY_COLLADABaseUtils 
	                NAMES "OpenCOLLADABaseUtils" 
	                HINTS ${COLLADA_ROOT}/lib/opencollada)
	 find_library(COLLADA_LIBRARY_COLLADAFramework
	                NAMES "OpenCOLLADAFramework" 
	                HINTS ${COLLADA_ROOT}/lib/opencollada)
	 find_library(COLLADA_LIBRARY_COLLADASaxFrameworkLoader 
	                NAMES "OpenCOLLADASaxFrameworkLoader" 
	                HINTS ${COLLADA_ROOT}/lib/opencollada)
	 find_library(COLLADA_LIBRARY_GeneratedSaxParser 
	                NAMES "GeneratedSaxParser" 
	                HINTS ${COLLADA_ROOT}/lib/opencollada)
	 find_library(COLLADA_LIBRARY_MathMLSolver 
	                NAMES "MathMLSolver" 
	                HINTS ${COLLADA_ROOT}/lib/opencollada)
	 find_library(COLLADA_LIBRARY_UTF 
	                NAMES "UTF" 
	                HINTS ${COLLADA_ROOT}/lib/opencollada)
	 find_library(COLLADA_LIBRARY_PCRE 
	                NAMES "pcre" 
	                HINTS ${COLLADA_ROOT}/lib/opencollada)
	 find_library(COLLADA_LIBRARY_XML 
	                NAMES "xml" 
	                HINTS ${COLLADA_ROOT}/lib/opencollada)
	                
	                
	 find_library(COLLADA_LIBRARY_COLLADABaseUtilsd 
	                NAMES "OpenCOLLADABaseUtilsd" 
	                HINTS ${COLLADA_ROOT}/lib/opencollada)
	 find_library(COLLADA_LIBRARY_COLLADAFrameworkd
	                NAMES "OpenCOLLADAFrameworkd" 
	                HINTS ${COLLADA_ROOT}/lib/opencollada)
	 find_library(COLLADA_LIBRARY_COLLADASaxFrameworkLoaderd 
	                NAMES "OpenCOLLADASaxFrameworkLoaderd" 
	                HINTS ${COLLADA_ROOT}/lib/opencollada)
	 find_library(COLLADA_LIBRARY_GeneratedSaxParserd 
	                NAMES "GeneratedSaxParserd" 
	                HINTS ${COLLADA_ROOT}/lib/opencollada)
	 find_library(COLLADA_LIBRARY_MathMLSolverd 
	                NAMES "MathMLSolverd" 
	                HINTS ${COLLADA_ROOT}/lib/opencollada)
	 find_library(COLLADA_LIBRARY_UTFd 
	                NAMES "UTFd" 
	                HINTS ${COLLADA_ROOT}/lib/opencollada)
	 find_library(COLLADA_LIBRARY_PCREd 
	                NAMES "pcred" 
	                HINTS ${COLLADA_ROOT}/lib/opencollada)
	 find_library(COLLADA_LIBRARY_XMLd 
	                NAMES "xmld" 
	                HINTS ${COLLADA_ROOT}/lib/opencollada)
	
	#optimized
	SET(COLLADA_LIBRARY ${COLLADA_LIBRARY} optimized ${COLLADA_LIBRARY_UTF})
	SET(COLLADA_LIBRARY ${COLLADA_LIBRARY} optimized ${COLLADA_LIBRARY_PCRE})
	SET(COLLADA_LIBRARY ${COLLADA_LIBRARY} optimized ${COLLADA_LIBRARY_COLLADABaseUtils})
	SET(COLLADA_LIBRARY ${COLLADA_LIBRARY} optimized ${COLLADA_LIBRARY_COLLADAFramework})
	
	SET(COLLADA_LIBRARY ${COLLADA_LIBRARY} optimized ${COLLADA_LIBRARY_XML})
	SET(COLLADA_LIBRARY ${COLLADA_LIBRARY} optimized ${COLLADA_LIBRARY_GeneratedSaxParser})
	SET(COLLADA_LIBRARY ${COLLADA_LIBRARY} optimized ${COLLADA_LIBRARY_MathMLSolver})
	SET(COLLADA_LIBRARY ${COLLADA_LIBRARY} optimized ${COLLADA_LIBRARY_COLLADASaxFrameworkLoader})
	
	#debug
	SET(COLLADA_DEBUG_LIBRARY ${COLLADA_DEBUG_LIBRARY} debug ${COLLADA_LIBRARY_UTFd})
	SET(COLLADA_DEBUG_LIBRARY ${COLLADA_DEBUG_LIBRARY} debug ${COLLADA_LIBRARY_PCREd})
	SET(COLLADA_DEBUG_LIBRARY ${COLLADA_DEBUG_LIBRARY} debug ${COLLADA_LIBRARY_COLLADABaseUtilsd})
	SET(COLLADA_DEBUG_LIBRARY ${COLLADA_DEBUG_LIBRARY} debug ${COLLADA_LIBRARY_COLLADAFrameworkd})
	
	SET(COLLADA_DEBUG_LIBRARY ${COLLADA_DEBUG_LIBRARY} debug ${COLLADA_LIBRARY_XMLd})
	SET(COLLADA_DEBUG_LIBRARY ${COLLADA_DEBUG_LIBRARY} debug ${COLLADA_LIBRARY_GeneratedSaxParserd})
	SET(COLLADA_DEBUG_LIBRARY ${COLLADA_DEBUG_LIBRARY} debug ${COLLADA_LIBRARY_MathMLSolverd})
	SET(COLLADA_DEBUG_LIBRARY ${COLLADA_DEBUG_LIBRARY} debug ${COLLADA_LIBRARY_COLLADASaxFrameworkLoaderd})

	list(APPEND ${DepName}_LIBS ${COLLADA_LIBRARY} )
	list(APPEND ${DepName}_LIBS ${COLLADA_DEBUG_LIBRARY} )
ENDIF()
