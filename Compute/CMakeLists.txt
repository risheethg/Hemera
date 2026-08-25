add_library(Compute STATIC
    src/engine.cu
)

set_target_properties(Compute PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
target_include_directories(Compute PUBLIC 
    include
    ../Core/vendor/Glad/include
)