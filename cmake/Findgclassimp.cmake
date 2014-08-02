SET(DepName "gclassimp")

SET(ASSIMP_ROOT "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
SET(LPATH ${ASSIMP_ROOT}/lib/)
if(${WIN32})
    SET(LIB_NAME "assimp")
    list(APPEND ${DepName}_LIBS optimized ${LPATH}${LIB_NAME}.lib)
    list(APPEND ${DepName}_LIBS debug ${LPATH}${LIB_NAME}d.lib)
ELSE()
    SET(LIB_NAME "libassimp")
    list(APPEND ${DepName}_LIBS ${LPATH}${LIB_NAME}.a)
ENDIF()

SET(${DepName}_INCLUDE_DIR  ${ASSIMP_ROOT}/include/)


#list(APPEND ${DepName}_DLL ${ASSIMP_ROOT}/bin/assimp.dll)
#list(APPEND ${DepName}_DLL ${ASSIMP_ROOT}/bin/assimpd.dll)

