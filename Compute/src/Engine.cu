#include <glad/glad.h>

#include "../include/interop.h"
#include <cuda_runtime.h>
#include <cuda_gl_interop.h>
#include <device_launch_parameters.h>

__global__ void smokeTestKernel(cudaSurfaceObject_t surface, int width, int height) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height) {
        float r = (float)x / width;
        float g = (float)y / height;
        float b = 0.8f;
        float a = 1.0f;
        float4 color = make_float4(r, g, b, a);
        surf2Dwrite(color, surface, x * sizeof(float4), y);
    }
}

cudaGraphicsResource* registerGLTextureForCUDA(unsigned int glTextureID) {
    cudaGraphicsResource* resource = nullptr;
    cudaGraphicsGLRegisterImage(&resource, glTextureID, GL_TEXTURE_2D, cudaGraphicsRegisterFlagsWriteDiscard);
    return resource;
}

void runSmokeTestKernel(cudaGraphicsResource* resource, int width, int height) {
    cudaGraphicsMapResources(1, &resource, 0);
    cudaArray_t mappedArray;
    cudaGraphicsSubResourceGetMappedArray(&mappedArray, resource, 0, 0);

    cudaResourceDesc resDesc = {};
    resDesc.resType = cudaResourceTypeArray;
    resDesc.res.array.array = mappedArray;

    cudaSurfaceObject_t surface;
    cudaCreateSurfaceObject(&surface, &resDesc);

    dim3 threads(16, 16);
    dim3 blocks((width + threads.x - 1) / threads.x, (height + threads.y - 1) / threads.y);
    smokeTestKernel<<<blocks, threads>>>(surface, width, height);
    cudaDeviceSynchronize();

    cudaDestroySurfaceObject(surface);
    cudaGraphicsUnmapResources(1, &resource, 0);
}

void unregisterGLTexture(cudaGraphicsResource* resource) {
    if (resource) cudaGraphicsUnregisterResource(resource);
}