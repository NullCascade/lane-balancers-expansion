@echo off
setlocal enabledelayedexpansion

set tiers=emptystring fast- express- turbo- kr-advanced- kr-superior- extreme- ultimate- high-speed- se-space- omt- wood- hyper-

for %%t in (%tiers%) do (
    set tier=%%t
    if "!tier!"=="emptystring" (
        set tier=
    )

    echo !tier!
    magick !tier!splitter.png -crop 64x64+0+0 !tier!splitter-64x64.png

    magick !tier!splitter-64x64.png -crop 64x12+0+0 !tier!lane-splitter-top.png
    magick !tier!splitter-64x64.png -gravity South -crop 64x24+0+0 !tier!lane-splitter-bottom.png

    magick !tier!lane-splitter-top.png !tier!lane-splitter-bottom.png -alpha on -append !tier!lane-splitter-1x1.png
    magick !tier!lane-splitter-1x1.png -gravity center -background none -extent 64x64 -strip !tier!lane-splitter.png
)

for /r . %%f in (*-64x64.png) do del "%%f"
for /r . %%f in (*-top.png) do del "%%f"
for /r . %%f in (*-bottom.png) do del "%%f"
for /r . %%f in (*-1x1.png) do del "%%f"

endlocal