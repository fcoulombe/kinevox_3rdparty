cmake_minimum_required (VERSION 2.8)
project (kinevox_3rdparty)

include(ExternalProject)
message("GIT_EXECUTABLE='${GIT_EXECUTABLE}'")

set(depname freetype2)
set(${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
set(${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
set(${depname}_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR} -DBUILD_SHARED_LIBS=false)

ExternalProject_Add(
   ${depname}
   PREFIX ${${depname}_PREFIX}
   GIT_REPOSITORY  ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
     INSTALL_DIR ${${depname}_INSTALL_DIR}
  CMAKE_ARGS ${${depname}_CMAKE_ARGS}
)

set(depname ogg)
set(${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
set(${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
set(${depname}_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR} -DBUILD_SHARED_LIBS=false)

ExternalProject_Add(
   ${depname}
   PREFIX ${${depname}_PREFIX}
   GIT_REPOSITORY  ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
     INSTALL_DIR ${${depname}_INSTALL_DIR}
  CMAKE_ARGS ${${depname}_CMAKE_ARGS}
)

set(depname eglew)
set(${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
set(${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
set(${depname}_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR} )

ExternalProject_Add(
   ${depname}
   PREFIX ${${depname}_PREFIX}
   GIT_REPOSITORY  ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
     INSTALL_DIR ${${depname}_INSTALL_DIR}
  CMAKE_ARGS ${${depname}_CMAKE_ARGS}
)

set(depname zlib)
set(${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
set(${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
set(${depname}_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR} )

ExternalProject_Add(
   ${depname}
   PREFIX ${${depname}_PREFIX}
   GIT_REPOSITORY  ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
     INSTALL_DIR ${${depname}_INSTALL_DIR}
  CMAKE_ARGS ${${depname}_CMAKE_ARGS}
)

set(depname libpng)
set(${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
set(${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
set(${depname}_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR} -DZLIB_ROOT=${${depname}_INSTALL_DIR} )
message("prefix: " ${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
message("inst: " ${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
message("cmake arg: " ${depname}_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR} -DZLIB_ROOT=${${depname}_INSTALL_DIR})
#message("inst dir: " ${${depname}_INSTALL_DIR})

ExternalProject_Add(
   ${depname}
   DEPENDS
   zlib
   PREFIX ${${depname}_PREFIX}
   GIT_REPOSITORY  ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
     INSTALL_DIR ${${depname}_INSTALL_DIR}
  CMAKE_ARGS ${${depname}_CMAKE_ARGS}
)
add_dependencies(libpng zlib)
set(depname OpenCOLLADA)
set(${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
set(${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
set(${depname}_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR} )

ExternalProject_Add(
   ${depname}
   PREFIX ${${depname}_PREFIX}
   GIT_REPOSITORY  ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
     INSTALL_DIR ${${depname}_INSTALL_DIR}
  CMAKE_ARGS ${${depname}_CMAKE_ARGS}
)

set(depname openal)
set(${depname}_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/${depname}")
set(${depname}_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/local/")
set(${depname}_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${${depname}_INSTALL_DIR} )

ExternalProject_Add(
   ${depname}
   PREFIX ${${depname}_PREFIX}
   GIT_REPOSITORY  ${CMAKE_CURRENT_SOURCE_DIR}/${depname} 
     INSTALL_DIR ${${depname}_INSTALL_DIR}
  CMAKE_ARGS ${${depname}_CMAKE_ARGS}
)

