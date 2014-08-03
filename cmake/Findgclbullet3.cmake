SET(DepName "gclbullet3")

get_filename_component(BULLET3_ROOT
                       "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/"
                       REALPATH)

SET(LPATH ${BULLET3_ROOT}/lib/)
SET(LIB_SUFFIX .a)
if(${WIN32})
    SET(LIB_NAME "LinearMath")
    list(APPEND ${DepName}_LIBS optimized ${LPATH}${LIB_NAME}${LIB_SUFFIX})
    list(APPEND ${DepName}_LIBS debug ${LPATH}${LIB_NAME}_Debug${LIB_SUFFIX})
    
    SET(LIB_NAME "Bullet3Common")
    list(APPEND ${DepName}_LIBS optimized ${LPATH}${LIB_NAME}${LIB_SUFFIX})
    list(APPEND ${DepName}_LIBS debug ${LPATH}${LIB_NAME}_Debug${LIB_SUFFIX})

    SET(LIB_NAME "BulletCollision")
    list(APPEND ${DepName}_LIBS optimized ${LPATH}${LIB_NAME}${LIB_SUFFIX})
    list(APPEND ${DepName}_LIBS debug ${LPATH}${LIB_NAME}_Debug${LIB_SUFFIX})
        
    SET(LIB_NAME "Bullet3Collision")
    list(APPEND ${DepName}_LIBS optimized ${LPATH}${LIB_NAME}${LIB_SUFFIX})
    list(APPEND ${DepName}_LIBS debug ${LPATH}${LIB_NAME}_Debug${LIB_SUFFIX})
    
    SET(LIB_NAME "BulletDynamics")
    list(APPEND ${DepName}_LIBS optimized ${LPATH}${LIB_NAME}${LIB_SUFFIX})
    list(APPEND ${DepName}_LIBS debug ${LPATH}${LIB_NAME}_Debug${LIB_SUFFIX})    
ELSE()
    
    SET(LIB_NAME "libLinearMath")
    list(APPEND ${DepName}_LIBS ${LPATH}${LIB_NAME}${LIB_SUFFIX})
    
    SET(LIB_NAME "libBullet3Common")
    list(APPEND ${DepName}_LIBS ${LPATH}${LIB_NAME}${LIB_SUFFIX})
    
    SET(LIB_NAME "libBulletCollision")
    list(APPEND ${DepName}_LIBS ${LPATH}${LIB_NAME}${LIB_SUFFIX})
    
    SET(LIB_NAME "libBullet3Collision")
    list(APPEND ${DepName}_LIBS ${LPATH}${LIB_NAME}${LIB_SUFFIX})
    
    SET(LIB_NAME "libBulletDynamics")
    list(APPEND ${DepName}_LIBS ${LPATH}${LIB_NAME}${LIB_SUFFIX})
    
ENDIF()

SET(${DepName}_INCLUDE_DIR  ${BULLET3_ROOT}/include/bullet)


#list(APPEND ${DepName}_DLL ${ASSIMP_ROOT}/bin/assimp.dll)
#list(APPEND ${DepName}_DLL ${ASSIMP_ROOT}/bin/assimpd.dll)

