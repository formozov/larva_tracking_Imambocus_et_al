::test version
ECHO "TEST VERSION: DO NOT USE"

mkdir reduce
mkdir crop
mkdir avi

for %%f in (*.mp4) do (
echo "%%f"
ffmpeg -i "%%f" -vf "select=not(mod(n\,200))" -vsync vfr -q:v 2 reduce/"%%f"
ffmpeg -i reduce/"%%f" -filter:v "crop=1288:600:0:200" -c:a copy crop/"%%f"
ffmpeg -i crop/"%%f" -pix_fmt nv12 -f avi -vcodec rawvideo avi/"%%f"
)
