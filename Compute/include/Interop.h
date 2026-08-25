#pragma once
struct cudaGraphicsResource;
cudaGraphicsResource* registerGLTextureForCUDA(unsigned int glTextureID);
void runSmokeTestKernel(cudaGraphicsResource* resource, int width, int height);
void unregisterGLTexture(cudaGraphicsResource* resource);