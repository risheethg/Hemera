cmake_minimum_required(VERSION 3.24)

set(CMAKE_CUDA_ARCHITECTURES 89)

project(Hemera LANGUAGES CXX CUDA)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(glfw3 CONFIG REQUIRED)
find_package(glm CONFIG REQUIRED)
find_package(spdlog CONFIG REQUIRED)
find_package(assimp CONFIG REQUIRED)
find_package(OpenCV CONFIG REQUIRED)

add_subdirectory(Core)
add_subdirectory(Compute)
add_subdirectory(App)

