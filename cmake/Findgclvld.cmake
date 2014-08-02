SET(DepName "gclvld")

SET(ZLIB_ROOT "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
SET(LPATH ${ZLIB_ROOT}/lib/)
SET(LIB_NAME "zlibstatic")
	
FIND_PATH(
		  ZLIB_INCLUDE_DIR zlib.h
		  PATHS ${ZLIB_ROOT}/include
		  NO_DEFAULT_PATH)
		
FindLibrary(ZLIB_LIBRARY ${LIB_NAME} ${LPATH})
SET(${DepName}_INCLUDE_DIR  ${ZLIB_INCLUDE_DIR})
list(APPEND ${DepName}_LIBS ${ZLIB_LIBRARY})
if(ENABLE_VLD)
SET(DEFAULT_VLD_ROOT "C:/Program Files (x86)/Visual Leak Detector/include")
SET(DEFAULT_VLD_ROOT2 "C:/Program Files/Visual Leak Detector/include")

find_path(VLD_INCLUDE_DIR vld.h
      PATHS
      ${DEFAULT_VLD_ROOT}
      ${DEFAULT_VLD_ROOT2}
      NO_DEFAULT_PATH
      )
      
if (${VLD_INCLUDE_DIR} STREQUAL VLD_INCLUDE_DIR-NOTFOUND)
    message("you don't have visual leak detector installed on your computer, please go here https://vld.codeplex.com/ and download the installer")
else()
    SET(${DepName}_INCLUDE_DIR  ${VLD_INCLUDE_DIR})
    add_definitions(-DUSE_VLD)

    IF (${KINEVOX_ARCHITECTURE} STREQUAL "32bit") 
        #DllInstall(${VLD_INCLUDE_DIR}/../bin/Win32/vld_x86.dll  TRUE)
        #DllInstall(${VLD_INCLUDE_DIR}/../bin/Win32/dbghelp.dll  TRUE)
        #DllInstall(${VLD_INCLUDE_DIR}/../bin/Win32/Microsoft.DTfW.DHL.manifest TRUE)
	list(APPEND ${DepName}_LIBS  ${VLD_INCLUDE_DIR}/../lib/Win32/vld.lib)
    ELSE()
	list(APPEND ${DepName}_LIBS   ${VLD_INCLUDE_DIR}/../lib/Win64/vld.lib)
        #DllInstall(${VLD_INCLUDE_DIR}/../bin/Win64/vld_x64.dll  TRUE)
        #DllInstall(${VLD_INCLUDE_DIR}/../bin/Win64/dbghelp.dll   TRUE)
        #DllInstall(${VLD_INCLUDE_DIR}/../bin/Win64/Microsoft.DTfW.DHL.manifest TRUE)
    ENDIF()   
endif()
endif()

