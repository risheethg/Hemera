add_library(Compute STATIC
    # ... other .cu files
)

set_target_properties(Compute PROPERTIES CUDA_SEPARABLE_COMPILATION ON)

target_include_directories(Compute PUBLIC src)