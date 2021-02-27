import pandas as pd
import numpy as np


import seaborn as sns

import matplotlib.pyplot as plt

import os 

# Nusreen's 

# 21 frames per second     103 frames in avi x 200 th frams = 20600 orginal video
# 20600 / 21 = 981 seconds or 16.35 min

# I will take frames 70 - 103 for the analysis 

#t1 = 70   # frame 14000
#t2 = 100  # frame 20000

#On. Fiji you go to file -import ffmpeg a pop up appear for asking for frame which for
#15 mins is 9000 I put 8900 to 9100 then when the video opens I go to frame 100 to be at 15 mins.

t1 = 45
t2 = 47


mypath = "./means/"

from os import listdir
from os.path import isfile, join
onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]
print(onlyfiles)


for f in onlyfiles:
    data = pd.read_csv(mypath + f)
    mean_mean1 = data.Mean1
    mean_mean2 = data.Mean2 

    PI21 =  (mean_mean2 - mean_mean1)/(mean_mean2 + mean_mean1)
    summ21=  mean_mean1 + mean_mean2 
       
    mean_mean3 = data.Mean3 
    mean_mean4 = data.Mean4
    PI43 = (mean_mean4 - mean_mean3)/(mean_mean4 + mean_mean3)
    summ43 =  mean_mean3 + mean_mean4 
    
    fig, ax = plt.subplots(1,2)
    fig.suptitle("intensity left vs intensity right", fontsize=14)
    ax[0].set_xlabel("intensity1")
    ax[0].set_ylabel("intensity2")
    ax[0].plot(mean_mean1,mean_mean2,'.')
    ax[1].set_xlabel("intensity3")
    ax[1].set_ylabel("intensity4")
    ax[1].plot(mean_mean3,mean_mean4,'.')

    plt.tight_layout()
    plt.savefig("plots/" + f + "-left-right.png")
    
    fig, ax = plt.subplots(1,2)
    fig.suptitle("PI", fontsize=14)
    ax[0].set_xlabel("t")
    ax[0].set_ylabel("PI21")
    ax[0].plot( PI21)
    ax[1].set_xlabel("t")
    ax[1].set_ylabel("PI43")
    ax[1].plot(PI43)
    plt.tight_layout()
    plt.savefig("plots/" + f + "-PI21-PI43.png")
    
    fig, ax = plt.subplots(1,2)
    fig.suptitle("SUM", fontsize=14)
    ax[0].set_xlabel("t")
    ax[0].set_ylabel("intensity1 + intensity2")
    ax[0].plot(summ21)
    ax[1].set_xlabel("t")
    ax[1].set_ylabel("intensity3 + intensity4")
    ax[1].plot(summ21)
    plt.tight_layout()
    plt.savefig("plots/" + f + "-sum12sum34.png")
    

    
    