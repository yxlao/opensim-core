
set(TEST_ENVIRONMENT checkEnvironment)       
set(TARGET_NAME opensim-${TEST_ENVIRONMENT})
 
add_executable(${TARGET_NAME}
    ${OpenSim_SOURCE_DIR}/OpenSim/Examples/checkEnvironment/test.cpp)         
target_link_libraries(${TARGET_NAME} osimTools)
set_target_properties(${TARGET_NAME}        
       PROPERTIES        
       PROJECT_LABEL "Utilities - ${TEST_ENVIRONMENT}"       
)        
         
file(GLOB DATA_FILES *.osim *.xml *.sto *.mot *.vtp *.obj)       
foreach(DATA_FILE ${DATA_FILES})        
    add_custom_command(        
        TARGET ${TARGET_NAME}        
        COMMAND ${CMAKE_COMMAND}          
        ARGS -E copy          
        ${DATA_FILE}          
        ${OpenSim_BINARY_DIR}/OpenSim/Examples/checkEnvironment       
        )          
endforeach(DATA_FILE)       
         
if(BUILD_TESTING)        
    set(TEST_EXAMPLE_MODEL testExampleModel)       

    add_test(${TEST_EXAMPLE_MODEL}Runs
        ${EXECUTABLE_OUTPUT_PATH}/${TARGET_NAME})          
endif(BUILD_TESTING)         
         
install(TARGETS ${TARGET_NAME} DESTINATION bin)
