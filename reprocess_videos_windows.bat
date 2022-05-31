:: Add the path to ffmpeg into the Path variable (see Windows enviroment variables)
:: Locate this script in the folder with *.mp4 files
:: Run Command prompt in Windows
:: Using Command prompt go to the folder with *.mp4 files by typing:
:: cd C:\Users\....\path_to_files\
:: In case the files are located not on C: hard drive but on the other disk (for example Q:), type
:: Q:
:: to switch to this hard drive
:: Run script by typing
:: reprocess_videos_windows.bat

ECHO "Analysis script"

mkdir reduce
mkdir crop
mkdir avi

for %%f in (*.mp4) do (
echo "%%f"
ffmpeg -i "%%f" -vf "select=not(mod(n\,200))" -vsync vfr -q:v 2 reduce/"%%f"
ffmpeg -i reduce/"%%f" -filter:v "crop=1288:600:0:200" -c:a copy crop/"%%f"
ffmpeg -i crop/"%%f" -pix_fmt nv12 -f avi -vcodec rawvideo avi/"%%f"
)
