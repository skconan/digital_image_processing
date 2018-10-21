"""
    File name: histogram_matching.py
    Author: skconan
    Python Version: 3.5
"""


import cv2 as cv
import numpy as np
import matplotlib.pyplot as plt

def histogram_matching(ref, input):
    ref = cv.resize(ref,(0,0),fx=0.125,fy=0.125)
    input = cv.resize(input,(0,0),fx=0.125,fy=0.125)
    hist_ref, _ = np.histogram(ref.flatten(), 256, [0, 256])
    hist_input, _ = np.histogram(input.flatten(), 256, [0, 256])

    cdf_ref = hist_ref.cumsum()
    cdf_input = hist_input.cumsum()

    xp = range(0, 256)
    lut = np.interp(cdf_input, cdf_ref, xp)
    lut = np.uint8(lut)

    output = np.uint8(np.interp(input, xp, lut))
    hist_output, _ = np.histogram(output.flatten(), 256, [0, 256])
    
    plt.plot(hist_ref,color='blue')
    plt.plot(hist_input,color='green')
    plt.plot(hist_output,color='red')
    plt.yscale('log')
    cv.imshow('Reference',ref)
    cv.imshow('Input',input)
    cv.imshow('Output',output)

    plt.show()
    # cv.waitKey(-1)

if __name__ == '__main__':
    ref = cv.imread(r'E:\Workspace\digital_image_processing\02_Histogram_Equalization\images\dark_bright.jpg',0)
    input = cv.imread(r'E:\Workspace\digital_image_processing\02_Histogram_Equalization\images\brightness.jpg',0)
    histogram_matching(ref,input)