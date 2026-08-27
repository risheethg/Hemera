add_executable(App
    src/App.cpp
)

target_link_libraries(App PRIVATE 
    Core 
    Compute
)