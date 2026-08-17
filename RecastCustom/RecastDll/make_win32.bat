@echo off
mkdir build32
pushd build32
cmake -G "Visual Studio 18 2026" .. || exit /b 1
popd
cmake --build build32 --config Release || exit /b 1
md Plugins\x86
copy /Y build32\Release\RecastDll.dll Plugins\x86\RecastDll.dll || exit /b 1
rmdir /S /Q build32
