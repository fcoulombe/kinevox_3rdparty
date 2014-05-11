SET(DepName "gclassimp")

SET(ASSIMP_ROOT "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
SET(LPATH ${ZLIB_ROOT}/lib/)
if(${WIN32})
    SET(LIB_NAME "assimp")
    FindLibrary(ASSIMP_LIBRARY ${LIB_NAME} ${LPATH})
    FindLibrary(ASSIMP_LIBRARY_debug ${LIB_NAME}d ${LPATH})
    list(APPEND ${DepName}_LIBS optimized ${ASSIMP_LIBRARY})
    list(APPEND ${DepName}_LIBS debug ${ASSIMP_LIBRARY_debug})
ELSE()
    SET(LIB_NAME "libassimp")
    FindLibrary(ASSIMP_LIBRARY ${LIB_NAME} ${LPATH})
    list(APPEND ${DepName}_LIBS ${ASSIMP_LIBRARY})
ENDIF()
FIND_PATH(
	ASSIMP_INCLUDE_DIR config.h
	PATHS ${ASSIMP_ROOT}/include/assimp)
		

SET(${DepName}_INCLUDE_DIR  ${ASSIMP_INCLUDE_DIR}/..)


#list(APPEND ${DepName}_DLL ${ASSIMP_ROOT}/bin/assimp.dll)
#list(APPEND ${DepName}_DLL ${ASSIMP_ROOT}/bin/assimpd.dll)

