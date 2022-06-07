# A two-choice assay for noxious light avoidance with intensity-based distribution analysis in Drosophila melanogaster larvae

The repo contains (1) scripts to analyze Drosophila larvae distributions in two-choice assays (such as light avoidance), and 
(2) the analysis of the distribution of the larva in the zone near the odor versus the rest of the arena in the chemotaxis assay.

### Two-choice assay (light avoidance)

The *reprocess_videos_linux.sh* script crops, reduces the number of frames, and converts *.mp4 videos into *.avi files for subsequent analysis. *bash* (or *gitbash*)
and *ffmpeg* packages should be installed.

*reprocess_avi_and_get_means.ijm* (ImageJ package) script subtracts static background from the resulting *.avi files, converts each frame into
a black and white binary mask, and quantifies the resulting intensities (sum of the white pixels) overtime on the left and the right side of the dish. 
The current script is written for two two-choice assays conducted simultaneously. The path to the input *.avi files should be provided. 
And the coordinates of the regions of interest should also be set.

The script *plot_means_PI.py* quickly draws the resulting mean intensities on the left and the right side of the two-choice assay and the evolution over 
time of performance indexes (PI's). As a control that the experiment and recording conditions remained constant, the sum left+right intensities also
provided as it should stay the same.

### Chemotaxis assay (odor zone analysis)

FIMTrack software was used to extract coordinates and kinematic
parameters of the larvae in an automatic way. Jupyter-notebook *tracking script.ipynb* contains the analysis pipeline for FIMTrack extracted data to calculate
the difference in time spent by larvae in the zone near the odor.

For any questions, please open a new issue.




