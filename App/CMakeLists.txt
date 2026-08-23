add_executable(App
    # ... other app files
)

# App automatically gets all PUBLIC includes and defines from Core and Compute
target_link_libraries(App PRIVATE 
    Core 
    Compute
    ${OpenCV_LIBS}
)