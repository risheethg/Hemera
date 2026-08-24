set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
add_subdirectory(vendor/GLFW)

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
    vendor/glm
    vendor/spdlog/include
)

target_link_libraries(Core PUBLIC glfw)

target_precompile_headers(Core PRIVATE src/Application/pch.h)

target_compile_definitions(Core PUBLIC 
    SPDLOG_COMPILED_LIB=0
    ENABLE_ASSERTS
    $<$<CONFIG:Debug>:_DEBUG>
    $<$<CONFIG:Release>:_RELEASE>
)