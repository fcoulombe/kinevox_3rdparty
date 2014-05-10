SET(DepName "gclopencl")

SET(OPENCL_ROOT "C:/Program Files (x86)/Intel/OpenCL SDK/3.0/")
if (${KINEVOX_ARCHITECTURE} STREQUAL "32bit")
	SET(LPATH ${OPENCL_ROOT}/lib/x86/)
else()
	SET(LPATH ${OPENCL_ROOT}/lib/x64/)
endif()
SET(LIB_NAME "OpenCL.lib")
	
FIND_PATH(OPENCL_INCLUDE_DIR cl.h
	PATHS "${OPENCL_ROOT}/include"
	"${OPENCL_ROOT}/include/CL")
FindLibrary(OPENCL_LIBRARY OpenCL ${LPATH})
 	
SET(${DepName}_INCLUDE_DIR ${OPENCL_INCLUDE_DIR}/.. )
list(APPEND ${DepName}_LIBS ${OPENCL_LIBRARY})
#message("opencl!!!" ${OPENCL_INCLUDE_DIR})
#message("opencl!!!" ${LPATH} ${LIB_NAME} ${OPENAL_LIBRARY})

