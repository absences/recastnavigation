@echo off
mkdir build_uwp
pushd build_uwp
cmake -G "Visual Studio 18 2026" -DCMAKE_SYSTEM_NAME=WindowsStore -DCMAKE_SYSTEM_VERSION=10.0 .. || exit /b 1
popd
cmake --build build_uwp --config Release || exit /b 1
md Plugins\WSA\x86
copy /Y build_uwp\Release\RecastDll.dll Plugins\WSA\x86\RecastDll.dll || exit /b 1
rmdir /S /Q build_uwp

mkdir build_uwp64
pushd build_uwp64
cmake -G "Visual Studio 18 2026" -A x64 -DCMAKE_SYSTEM_NAME=WindowsStore -DCMAKE_SYSTEM_VERSION=10.0 .. || exit /b 1
popd
cmake --build build_uwp64 --config Release || exit /b 1
md Plugins\WSA\x64
copy /Y build_uwp64\Release\RecastDll.dll Plugins\WSA\x64\RecastDll.dll || exit /b 1
rmdir /S /Q build_uwp64

mkdir build_uwp_arm
pushd build_uwp_arm
cmake -G "Visual Studio 18 2026" -A ARM -DCMAKE_SYSTEM_NAME=WindowsStore -DCMAKE_SYSTEM_VERSION=10.0 .. || exit /b 1
popd
cmake --build build_uwp_arm --config Release || exit /b 1
md Plugins\WSA\ARM
copy /Y build_uwp_arm\Release\RecastDll.dll Plugins\WSA\ARM\RecastDll.dll || exit /b 1
rmdir /S /Q build_uwp_arm

mkdir build_uwp_arm64
pushd build_uwp_arm64
cmake -G "Visual Studio 18 2026" -A ARM64 -DCMAKE_SYSTEM_NAME=WindowsStore -DCMAKE_SYSTEM_VERSION=10.0 .. || exit /b 1
popd
cmake --build build_uwp_arm64 --config Release || exit /b 1
md Plugins\WSA\ARM64
copy /Y build_uwp_arm64\Release\RecastDll.dll Plugins\WSA\ARM64\RecastDll.dll || exit /b 1
rmdir /S /Q build_uwp_arm64
