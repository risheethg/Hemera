cmake_minimum_required(VERSION 3.24)

set(CMAKE_CUDA_ARCHITECTURES 89)

project(CudaGlTemplate LANGUAGES C CXX CUDA)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(Core)
add_subdirectory(Compute)
add_subdirectory(App)