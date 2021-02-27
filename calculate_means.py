import pandas as pd
import numpy as np

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
    mean_mean1 = data.Mean1[t1:t2].mean()  
    mean_mean2 = data.Mean2[t1:t2].mean() 
    mean_mean3 = data.Mean3[t1:t2].mean() 
    mean_mean4 = data.Mean4[t1:t2].mean()
    print(f.split('.')[0] + " " + str(mean_mean1) + " " + str(mean_mean2) + " " + str(mean_mean3) + " " + str(mean_mean4))
    

