SET(DepName "gclbullet3")

SET(BULLET3_ROOT "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
SET(LPATH ${BULLET3_ROOT}/lib/)
if(${WIN32})
    SET(LIB_NAME "libLinearMath")
    FindLibrary(BULLET3LINEARMATH_LIBRARY ${LIB_NAME} ${LPATH})
    FindLibrary(BULLET3LINEARMATH_LIBRARY_debug ${LIB_NAME}d ${LPATH})
    list(APPEND ${DepName}_LIBS optimized ${BULLET3LINEARMATH_LIBRARY})
    list(APPEND ${DepName}_LIBS debug ${BULLET3LINEARMATH_LIBRARY_debug})
    
    SET(LIB_NAME "libBullet3Common")
    FindLibrary(BULLET3COMMON_LIBRARY ${LIB_NAME} ${LPATH})
    FindLibrary(BULLET3COMMON_LIBRARY_debug ${LIB_NAME}d ${LPATH})
    list(APPEND ${DepName}_LIBS optimized ${BULLET3COMMON_LIBRARY})
    list(APPEND ${DepName}_LIBS debug ${BULLET3COMMON_LIBRARY_debug})

    SET(LIB_NAME "libBulletCollision")
    FindLibrary(BULLETCOLLISION_LIBRARY ${LIB_NAME} ${LPATH})
    FindLibrary(BULLETCOLLISION_LIBRARY_debug ${LIB_NAME}d ${LPATH})
    list(APPEND ${DepName}_LIBS optimized ${BULLETCOLLISION_LIBRARY})
    list(APPEND ${DepName}_LIBS debug ${BULLETCOLLISION_LIBRARY_debug})
        
    SET(LIB_NAME "libBullet3Collision")
    FindLibrary(BULLET3COLLISION_LIBRARY ${LIB_NAME} ${LPATH})
    FindLibrary(BULLET3COLLISION_LIBRARY_debug ${LIB_NAME}d ${LPATH})
    list(APPEND ${DepName}_LIBS optimized ${BULLET3COLLISION_LIBRARY})
    list(APPEND ${DepName}_LIBS debug ${BULLET3COLLISION_LIBRARY_debug})
    
    SET(LIB_NAME "libBulletDynamics")
    FindLibrary(BULLETDYNAMICS_LIBRARY ${LIB_NAME} ${LPATH})
    FindLibrary(BULLETDYNAMICS_LIBRARY_debug ${LIB_NAME}d ${LPATH})
    list(APPEND ${DepName}_LIBS optimized ${BULLETDYNAMICS_LIBRARY})
    list(APPEND ${DepName}_LIBS debug ${BULLETDYNAMICS_LIBRARY_debug})
    
ELSE()
    
    SET(LIB_NAME "libLinearMath")
    FindLibrary(BULLET3LINEARMATH_LIBRARY ${LIB_NAME} ${LPATH})
    list(APPEND ${DepName}_LIBS ${BULLET3LINEARMATH_LIBRARY})
    
    SET(LIB_NAME "libBullet3Common")
    FindLibrary(BULLET3COMMON_LIBRARY ${LIB_NAME} ${LPATH})
    list(APPEND ${DepName}_LIBS ${BULLET3COMMON_LIBRARY})
    
    SET(LIB_NAME "libBulletCollision")
    FindLibrary(BULLETCOLLISION_LIBRARY ${LIB_NAME} ${LPATH})
    list(APPEND ${DepName}_LIBS ${BULLETCOLLISION_LIBRARY})
    
    SET(LIB_NAME "libBullet3Collision")
    FindLibrary(BULLET3COLLISION_LIBRARY ${LIB_NAME} ${LPATH})
    list(APPEND ${DepName}_LIBS ${BULLET3COLLISION_LIBRARY})
    
    SET(LIB_NAME "libBulletDynamics")
    FindLibrary(BULLETDYNAMICS_LIBRARY ${LIB_NAME} ${LPATH})
    list(APPEND ${DepName}_LIBS ${BULLETDYNAMICS_LIBRARY})
    
    #SET(LIB_NAME "libBullet3Geometry")
    #FindLibrary(BULLET3GEOMETRY_LIBRARY ${LIB_NAME} ${LPATH})
    #list(APPEND ${DepName}_LIBS ${BULLET3GEOMETRY_LIBRARY})
ENDIF()
FIND_PATH(
	BULLET3_INCLUDE_DIR btBulletCollisionCommon.h
	PATHS ${BULLET3_ROOT}/include/bullet)
		

SET(${DepName}_INCLUDE_DIR  ${BULLET3_INCLUDE_DIR})


#list(APPEND ${DepName}_DLL ${ASSIMP_ROOT}/bin/assimp.dll)
#list(APPEND ${DepName}_DLL ${ASSIMP_ROOT}/bin/assimpd.dll)

