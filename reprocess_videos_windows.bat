:: Add the path to ffmpeg into the Path variable (see Windows enviroment variables)
:: See https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/
:: for more details
:: Locate this script in the folder with *.mp4 files
:: Run Command prompt in Windows
:: Using Command prompt go to the folder with *.mp4 files by typing:
:: cd C:\Users\....\path_to_files\
:: In case the files are located not on C: hard drive but on the other disk (for example Q:), type
:: Q:
:: to switch to this hard drive
:: Run script by typing
:: reprocess_videos_windows.bat

:: DEFINE THESE PARAMETERS and test the script (it is recommended to use a short video for the test)

SET /A take_each_n_frame = 200 
SET /A width = 1288 
SET /A height = 600
SET /A X = 0
SET /A Y = 200

ECHO "Analysis script"

mkdir reduce
mkdir crop
mkdir avi

for %%f in (*.mp4) do (
echo "%%f"
ffmpeg -i "%%f" -vf "select=not(mod(n\,take_each_n_frame))" -vsync vfr -q:v 2 reduce/"%%f"
ffmpeg -i reduce/"%%f" -filter:v "crop=width:height:X:Y" -c:a copy crop/"%%f"
ffmpeg -i crop/"%%f" -pix_fmt nv12 -f avi -vcodec rawvideo avi/"%%f"
)
