add_executable(exampleHopperDevice
    exampleHopperDevice.cpp
    buildHopperModel.cpp
    buildDeviceModel.cpp
    defineDeviceAndController.h
    helperMethods.h)
target_link_libraries(exampleHopperDevice osimTools)
set_target_properties(exampleHopperDevice PROPERTIES
    PROJECT_LABEL "Hopper Device"
    FOLDER "Examples"
    EXCLUDE_FROM_ALL TRUE
    )

add_executable(exampleHopperDeviceAnswers
    exampleHopperDevice_answers.cpp
    buildHopperModel.cpp
    buildDeviceModel_answers.cpp
    defineDeviceAndController_answers.h
    helperMethods.h)
target_link_libraries(exampleHopperDeviceAnswers osimTools)
set_target_properties(exampleHopperDeviceAnswers PROPERTIES
    PROJECT_LABEL "Hopper Device Answers"
    FOLDER "Example answers"
    EXCLUDE_FROM_ALL TRUE
    )


# Install.
set(hopper_install_dir "${OPENSIM_INSTALL_CPPEXDIR}/HopperDevice")
file(RELATIVE_PATH _opensim_home_relpath
        "${CMAKE_INSTALL_PREFIX}/${hopper_install_dir}"
        "${CMAKE_INSTALL_PREFIX}")
configure_file(CMakeListsToInstall.txt.in
               ${CMAKE_CURRENT_BINARY_DIR}/CMakeLists.txt @ONLY)
file(GLOB FILES_TO_INSTALL *.h *.cpp)
install(FILES ${FILES_TO_INSTALL} ${CMAKE_CURRENT_BINARY_DIR}/CMakeLists.txt
        DESTINATION ${hopper_install_dir})



