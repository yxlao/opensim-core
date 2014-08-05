SET(KIT opensim)
SET(UKIT PYOPENSIM)

IF(BUILD_PYTHON_WRAPPING)

INCLUDE(${CMAKE_ROOT}/Modules/FindPythonLibs.cmake)
INCLUDE(${CMAKE_ROOT}/Modules/FindPythonInterp.cmake)


IF(NOT PYTHONLIBS_FOUND)
    MESSAGE(FATAL_ERROR "Cannot build Python wrapping because "
    	"Python libraries were not found. Either turn "
    	"BUILD_PYTHON_WRAPPING off or install Python "
    	"libraries (on Ubuntu, apt-get install python2.7-dev).")
ENDIF()


SET(swig_common_output_cxx_file_fullname
    ${CMAKE_CURRENT_BINARY_DIR}/pyOpenSimCommon_wrap.cxx)
SET(swig_common_output_header_file_fullname
    ${CMAKE_CURRENT_BINARY_DIR}/pyOpenSimCommon_wrap.h)
SET(swig_output_cxx_file_fullname
    ${CMAKE_CURRENT_BINARY_DIR}/pyOpenSim_wrap.cxx)
SET(swig_output_header_file_fullname
    ${CMAKE_CURRENT_BINARY_DIR}/pyOpenSim_wrap.h)

SET(swig_common_interface_file_fullname
    ${OpenSim_SOURCE_DIR}/OpenSim/Wrapping/Python/swig/pyWrapOpenSimCommon.i)
SET(swig_interface_file_fullname
    ${OpenSim_SOURCE_DIR}/OpenSim/Wrapping/Python/swig/pyWrapOpenSim.i)

SET(swig_common_python_file_fullname
    ${CMAKE_CURRENT_BINARY_DIR}/common.py)
SET(swig_python_file_fullname
    ${CMAKE_CURRENT_BINARY_DIR}/simulation.py)
SET(SimTK_INCLUDE_PATH ${SIMTK_INCLUDE_DIR})

# Using a custom command / custom target pair so that SWIG is only run when
# it's out of date. Previously, we used a custom target only. But, custom
# targets are always out of date.
ADD_CUSTOM_COMMAND(
    OUTPUT
        ${swig_common_output_cxx_file_fullname}
        ${swig_common_output_header_file_fullname}
        ${swig_common_python_file_fullname}
    COMMAND ${SWIG_EXECUTABLE} -v -c++ -python -small
        -I${OpenSim_SOURCE_DIR}
        -I${Simbody_INCLUDE_DIR}
        -I${OpenSim_SOURCE_DIR}/OpenSim/Wrapping
    	-o ${swig_common_output_cxx_file_fullname}
        -outdir ${CMAKE_CURRENT_BINARY_DIR}
        ${swig_common_interface_file_fullname}
    DEPENDS
        ${swig_common_interface_file_fullname}
        )
ADD_CUSTOM_COMMAND(
    OUTPUT
        ${swig_output_cxx_file_fullname}
        ${swig_output_header_file_fullname}
        ${swig_python_file_fullname}
    COMMAND ${SWIG_EXECUTABLE} -v -c++ -python -small
        -I${OpenSim_SOURCE_DIR}
        -I${Simbody_INCLUDE_DIR}
        -I${OpenSim_SOURCE_DIR}/OpenSim/Wrapping
    	-o ${swig_output_cxx_file_fullname}
        -outdir ${CMAKE_CURRENT_BINARY_DIR}
        ${swig_interface_file_fullname}
    DEPENDS
        ${swig_interface_file_fullname}
        )

ADD_CUSTOM_TARGET(PyWrap
    DEPENDS
        ${swig_common_output_cxx_file_fullname}
        ${swig_common_output_header_file_fullname}
        ${swig_common_python_file_fullname}
        ${swig_output_cxx_file_fullname}
        ${swig_output_header_file_fullname}
        ${swig_python_file_fullname}
        )

SET_TARGET_PROPERTIES(PyWrap PROPERTIES PROJECT_LABEL "Python Bindings - Generate")

# Preliminary stuff for building libraries.
# -----------------------------------------
INCLUDE_DIRECTORIES(${OpenSim_SOURCE_DIR} 
					${OpenSim_SOURCE_DIR}/Vendors 
					${PYTHON_INCLUDE_PATH}
)

LINK_LIBRARIES(osimCommon osimSimulation osimAnalyses osimTools osimActuators
    ${PYTHON_LIBRARIES})

SET(SOURCE_FILES OpenSimContext.cpp "${swig_common_output_cxx_file_fullname}")
SET(INCLUDE_FILES OpenSimContext.h
    "${swig_common_output_header_file_fullname}")

ADD_LIBRARY(_common SHARED ${SOURCE_FILES} ${INCLUDE_FILES})

# Resulting library must be named _<libname>.so on Unix, _<libname>.pyd on
# Windows.
SET_TARGET_PROPERTIES(_common PROPERTIES
   PROJECT_LABEL "Python Bindings - _common"
   PREFIX ""
)
IF(WIN32)
    SET_TARGET_PROPERTIES(_common PROPERTIES SUFFIX ".pyd")
ELSEIF(APPLE)
    # Defaults to .dylib; change to .so.
    SET_TARGET_PROPERTIES(_common PROPERTIES SUFFIX ".so")
ENDIF()

# Shared libraries are needed at runtime for applications, so we put them
# at the top level in OpenSim/bin/*.dll (Windows) or OpenSim/lib/*.so (Linux)
# or OpemSim/lib/*.dylib (Mac). Windows .lib files, and Linux/Mac .a static
# archives are only needed at link time so go in sdk/lib.
INSTALL(TARGETS _common
        RUNTIME DESTINATION sdk/python/opensim
        LIBRARY DESTINATION sdk/python/opensim
        ARCHIVE DESTINATION sdk/python/opensim)

SET(SOURCE_FILES OpenSimContext.cpp "${swig_output_cxx_file_fullname}")
SET(INCLUDE_FILES OpenSimContext.h "${swig_output_header_file_fullname}")

ADD_LIBRARY(_simulation SHARED ${SOURCE_FILES} ${INCLUDE_FILES})

SET_TARGET_PROPERTIES(_simulation PROPERTIES
   PROJECT_LABEL "Python Bindings - _simulation"
   PREFIX ""
)
IF(WIN32)
    SET_TARGET_PROPERTIES(_simulation PROPERTIES SUFFIX ".pyd")
ELSEIF(APPLE)
    # Defaults to .dylib; change to .so.
    SET_TARGET_PROPERTIES(_simulation PROPERTIES SUFFIX ".so")
ENDIF()

INSTALL(TARGETS _simulation
        RUNTIME DESTINATION sdk/python/opensim
        LIBRARY DESTINATION sdk/python/opensim
        ARCHIVE DESTINATION sdk/python/opensim)

#install .py files
INSTALL(FILES setup.py DESTINATION sdk/python)
INSTALL(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/simulation.py
    ${CMAKE_CURRENT_BINARY_DIR}/common.py
    DESTINATION sdk/python/opensim)
INSTALL(FILES __init__.py DESTINATION sdk/python/opensim)
INSTALL(DIRECTORY tests DESTINATION sdk/python/opensim)

ENDIF(BUILD_PYTHON_WRAPPING)
