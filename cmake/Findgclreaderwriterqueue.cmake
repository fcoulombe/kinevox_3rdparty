SET(DepName "gclreaderwriterqueue")

get_filename_component(READERWRITERQUEUE_ROOT
                       "${CMAKE_CURRENT_LIST_DIR}/../binaries/${CMAKE_SYSTEM_NAME}${CMAKE_CXX_COMPILER_ID}${KINEVOX_ARCHITECTURE}/usr/"
                       REALPATH)

SET(${DepName}_INCLUDE_DIR  ${READERWRITERQUEUE_ROOT}/include/readerwriterqueue)
list(APPEND ${DepName}_LIBS "")

