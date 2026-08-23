add_library(Core STATIC
    src/Application/Application.cpp
    src/Application/pch.cpp
    # ... list your other Core .cpp files here ...
    
    # Vendored dependencies compiled directly into Core
    vendor/Glad/src/glad.c
    vendor/imgui/imgui.cpp
    vendor/imgui/imgui_draw.cpp
    vendor/imgui/imgui_tables.cpp
    vendor/imgui/imgui_widgets.cpp
    vendor/imgui/backends/imgui_impl_glfw.cpp
    vendor/imgui/backends/imgui_impl_opengl3.cpp
)

target_include_directories(Core PUBLIC
    src
    src/Application
    vendor/Glad/include
    vendor/imgui
    vendor/stb_image
)

target_link_libraries(Core PUBLIC 
    glfw 
    glm::glm 
    spdlog::spdlog 
    assimp::assimp
)

target_precompile_headers(Core PRIVATE src/Application/pch.h)

target_compile_definitions(Core PUBLIC 
    ENABLE_ASSERTS
    $<$<CONFIG:Debug>:_DEBUG>
    $<$<CONFIG:Release>:_RELEASE>
)