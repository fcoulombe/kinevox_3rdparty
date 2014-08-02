cmake_minimum_required (VERSION 2.8)
project (kinevox_3rdparty)

SET(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "limited configs"  FORCE)
IF(${CMAKE_SYSTEM_NAME} STREQUAL "Android")
set(EXTRA_ARGS -DCMAKE_TOOLCHAIN_FILE=/home/franky/src/kinevox2/android-toolchain.txt -D__ANDROID__=1 -DANDROID_DIR=/home/franky/src/android-ndk-r10 -DANDROID_NDK_VERSION=android-ndk-r10)
SET(KINEVOX_ARCHITECTURE "64bit")
ELSE()
set(EXTRA_ARGS "")

INCLUDE(CheckTypeSize)
CHECK_TYPE_SIZE (size_t SIZE_T_SIZE)

IF(${SIZE_T_SIZE} EQUAL 4)
SET(KINEVOX_ARCHITECTURE "32bit")
else()
SET(KINEVOX_ARCHITECTURE "64bit")
ENDIF()
ENDIF()

include(ExternalProject)
message("GIT_EXECUTABLE='${GIT_EXECUTABLE}'")

set(depname freetype2)
set(${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
set(${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
set(${depname}_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR} -DBUILD_SHARED_LIBS=false ${EXTRA_ARGS})

ExternalProject_Add(
   ${depname}
   PREFIX ${${depname}_PREFIX}
   #GIT_REPOSITORY  ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
   DOWNLOAD_COMMAND ""
   SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
     INSTALL_DIR ${${depname}_INSTALL_DIR}
  CMAKE_ARGS ${${depname}_CMAKE_ARGS}
)

set(depname ogg)
set(${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
set(${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
set(${depname}_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR} -DBUILD_SHARED_LIBS=false ${EXTRA_ARGS})

ExternalProject_Add(
   ${depname}
   PREFIX ${${depname}_PREFIX}
   #GIT_REPOSITORY  ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
      DOWNLOAD_COMMAND ""
   SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
     INSTALL_DIR ${${depname}_INSTALL_DIR}
  CMAKE_ARGS ${${depname}_CMAKE_ARGS}
)

set(depname vorbis)
set(${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
set(${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
set(${depname}_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR} -DBUILD_SHARED_LIBS=false -DOGG_ROOT=${${depname}_INSTALL_DIR} ${EXTRA_ARGS})

ExternalProject_Add(
   ${depname}
   PREFIX ${${depname}_PREFIX}
   DEPENDS
   ogg
   #GIT_REPOSITORY  ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
      DOWNLOAD_COMMAND ""
   SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
     INSTALL_DIR ${${depname}_INSTALL_DIR}
  CMAKE_ARGS ${${depname}_CMAKE_ARGS}
)

set(depname eglew)
set(${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
set(${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
set(${depname}_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR}  ${EXTRA_ARGS})

ExternalProject_Add(
   ${depname}
   PREFIX ${${depname}_PREFIX}
   #GIT_REPOSITORY  ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
      DOWNLOAD_COMMAND ""
   SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
     INSTALL_DIR ${${depname}_INSTALL_DIR}
  CMAKE_ARGS ${${depname}_CMAKE_ARGS}
)

set(depname zlib)
set(${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
set(${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
set(${depname}_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR} ${EXTRA_ARGS} )

ExternalProject_Add(
   ${depname}
   PREFIX ${${depname}_PREFIX}
   #GIT_REPOSITORY  ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
       DOWNLOAD_COMMAND ""
   SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
     INSTALL_DIR ${${depname}_INSTALL_DIR}
  CMAKE_ARGS ${${depname}_CMAKE_ARGS}
)

set(depname libpng)
set(${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
set(${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
set(${depname}_CMAKE_ARGS -DPNG_TESTS=false -DPNG_SHARED=false -DPNG_STATIC=true -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR} -DZLIB_ROOT=${${depname}_INSTALL_DIR} )
message("prefix: " ${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
message("inst: " ${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
message("cmake arg: " ${depname}_CMAKE_ARGS -DPNG_TESTS=false -DPNG_SHARED=false -DPNG_STATIC=true -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR} -DZLIB_ROOT=${${depname}_INSTALL_DIR} ${EXTRA_ARGS})
#message("inst dir: " ${${depname}_INSTALL_DIR})

ExternalProject_Add(
   ${depname}
   DEPENDS
   zlib
   PREFIX ${${depname}_PREFIX}
   #GIT_REPOSITORY  ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
       DOWNLOAD_COMMAND ""
   SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
     INSTALL_DIR ${${depname}_INSTALL_DIR}
  CMAKE_ARGS ${${depname}_CMAKE_ARGS}
)

IF(NOT ${CMAKE_SYSTEM_NAME} STREQUAL "Android")
set(depname assimp)
set(${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
set(${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
set(${depname}_CMAKE_ARGS -DBUILD_SHARED_LIBS=false -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR}  ${EXTRA_ARGS})

ExternalProject_Add(
   ${depname}
   PREFIX ${${depname}_PREFIX}
   #GIT_REPOSITORY  ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
       DOWNLOAD_COMMAND ""
   SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
     INSTALL_DIR ${${depname}_INSTALL_DIR}
  CMAKE_ARGS ${${depname}_CMAKE_ARGS}
)
ENDIF()

set(depname bullet3)
set(${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
set(${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
set(${depname}_CMAKE_ARGS -DBUILD_SHARED_LIBS=false -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR} -DBUILD_BULLET2_DEMOS=false -DBUILD_UNIT_TESTS=false -DBUILD_BULLET3_DEMOS=false -DBUILD_CPU_DEMOS=false -DBUILD_EXTRAS=false -DINSTALL_LIBS=true -DUSE_MSVC_RUNTIME_LIBRARY_DLL=true ${EXTRA_ARGS})

ExternalProject_Add(
   ${depname}
   PREFIX ${${depname}_PREFIX}
   #GIT_REPOSITORY  ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
       DOWNLOAD_COMMAND ""
   SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
     INSTALL_DIR ${${depname}_INSTALL_DIR}
  CMAKE_ARGS ${${depname}_CMAKE_ARGS}
)

#set(depname OpenCOLLADA)
#set(${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
#set(${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
#set(${depname}_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR} )

#ExternalProject_Add(
#   ${depname}
#   PREFIX ${${depname}_PREFIX}
#   GIT_REPOSITORY  ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
#     INSTALL_DIR ${${depname}_INSTALL_DIR}
#  CMAKE_ARGS ${${depname}_CMAKE_ARGS}
#)

set(depname openal)
set(${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
set(${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
set(${depname}_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR}  ${EXTRA_ARGS})

ExternalProject_Add(
   ${depname}
   PREFIX ${${depname}_PREFIX}
   #GIT_REPOSITORY  ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
       DOWNLOAD_COMMAND ""
   SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
     INSTALL_DIR ${${depname}_INSTALL_DIR}
  CMAKE_ARGS ${${depname}_CMAKE_ARGS}
)

