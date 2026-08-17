@echo off
mkdir build64
pushd build64
cmake -G "Visual Studio 18 2026" -A x64 .. || exit /b 1
popd
cmake --build build64 --config Release || exit /b 1
md Plugins\x86_64
copy /Y build64\Release\RecastDll.dll Plugins\x86_64\RecastDll.dll || exit /b 1
rmdir /S /Q build64
