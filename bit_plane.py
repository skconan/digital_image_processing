'''
    File name       : bit_plane.py
    Author          : skconan
    Date created    : 2018/08/15
'''

import cv2 as cv
import numpy as np
import constant as CONST
import  matplotlib.pyplot as plt

def dec2bin(dec,index):
    return int(bin(dec).replace('0b','').zfill(8)[index])

def bit_plane():
    gray = cv.imread(CONST.IMG_PATH+'/bill.jpg',0)
    # gray = cv.resize(gray,(0, 0), fx=0.5, fy=0.5)
    r,c = gray.shape
    cv.imshow('original',gray.copy())
    _, axarr1 = plt.subplots(8)
    # tmp = np.zeros((r,c),np.uint8)
    tmp = 0
    
    res = []
    # plane 1 least significant 
    for k in range(8):
        res.append([])
        for i in range(r):
            res[k].append([])
            for j in range(c):
                res[k][i].append(dec2bin(gray[i][j],7-k)*255)
        if k > 0:
            res[k] = np.array(res[k],np.uint8)
        else:
            res[k] = np.array(res[k],np.uint8)

        cv.imshow('result '+str(k+1),res[k])
        cv.waitKey(-1)

if __name__ == '__main__':
    bit_plane()
