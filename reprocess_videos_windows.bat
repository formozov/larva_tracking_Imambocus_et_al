::test version
ECHO "TEST VERSION: DO NOT USE"

mkdir reduce
mkdir crop
mkdir avi

for %%f in (*.mpg) do (
echo "%%f"
Q:\Andrey\Drosophila\LARVATRACK\ProtocolTest\ffmpeg\ffmpeg-2021-12-20-git-631e31773b-essentials_build\ffmpeg-2021-12-20-git-631e31773b-essentials_build\bin\ffmpeg.exe -i "%%f" -vf "select=not(mod(n\,200))" -vsync vfr -q:v 2 reduce/"%%f"
Q:\Andrey\Drosophila\LARVATRACK\ProtocolTest\ffmpeg\ffmpeg-2021-12-20-git-631e31773b-essentials_build\ffmpeg-2021-12-20-git-631e31773b-essentials_build\bin\ffmpeg.exe -i reduce/"%%f" -filter:v "crop=1288:600:0:200" -c:a copy crop/"%%f"
Q:\Andrey\Drosophila\LARVATRACK\ProtocolTest\ffmpeg\ffmpeg-2021-12-20-git-631e31773b-essentials_build\ffmpeg-2021-12-20-git-631e31773b-essentials_build\bin\ffmpeg.exe -i crop/"%%f" -pix_fmt nv12 -f avi -vcodec rawvideo avi/"%%f"
)
