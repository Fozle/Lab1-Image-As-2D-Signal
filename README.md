# Lab 1 – Image as a 2D Signal

## Objective

The objective of this experiment was to understand how a digital image works as a two-dimensional signal. I investigated quantization, dynamic range, histograms, contrast stretching, gamma correction, and image sampling using MATLAB.

## 1. Image Loading and Grayscale Conversion

I loaded the peppers image and converted it from RGB to grayscale. The image size was 384 × 512 pixels. The image data type was uint8, with an intensity range from 8 to 255.

## 2. Quantization and Dynamic Range

I compared 8-bit, approximately 6-bit, and 4-bit images.

The 8-bit image showed more intensity levels and smoother transitions. The 6-bit and 4-bit images had fewer intensity levels. This caused visible loss of detail and posterization.

## 3. Histogram and Contrast Stretching

I examined the original and contrast-stretched histograms.

Contrast stretching expanded the intensity range. This improved the visibility of details by increasing the difference between darker and brighter areas.

## 4. Gamma Correction

I tested gamma values of 0.6 and 1.6.

Gamma 0.6 made the image brighter. Gamma 1.6 made the image darker. Gamma correction changes image brightness using a nonlinear operation.

## 5. Sampling and Aliasing

I reduced the image size to 10% using nearest-neighbour sampling and then enlarged it to its original size.

The enlarged image showed visible pixelation and loss of details. This happened because the downsampling process removed image information.

## 6. Conclusion

This experiment showed that sampling, quantization, and image enhancement affect digital image quality. Higher bit depth preserves more intensity information, while suitable sampling helps preserve image details.

## AI Usage

**Tool used:** ChatGPT

**How I used it:** I used ChatGPT to understand MATLAB image-processing commands and the assignment requirements.

**What I verified or changed:** I ran the MATLAB script myself, checked the generated figures, and observed the differences between the processed images.
