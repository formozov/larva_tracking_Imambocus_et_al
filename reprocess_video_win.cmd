for %%f in (*.in) do (
    echo %%~nf
    process_in "%%~nf.in"
    process_out "%%~nf.out"
)