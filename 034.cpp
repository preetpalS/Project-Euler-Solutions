
#include <cassert>
#include <cstdint>
#include <iostream>
#include <string>

/*
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
Find the sum of all numbers which are equal to the sum of the factorial of their digits.
Note: as 1! = 1 and 2! = 2 are not sums they are not included.
*/

int factorial(int n) {
  assert(n > -1);

  if (n == 0) {
    return 1;
  } else {
    int toReturn = 1;

    for (auto i = 2; i <= n; ++i) {
      toReturn = toReturn * i;
    }

    return toReturn;
  }
}

int sumOfFactorialsOfDigits(int n) {
  int sum = 0;
  std::string nS = std::to_string(n);

  for (char& c : nS) {
    switch(c) {
    case '0':
      sum += factorial(0);
      break;
    case '1':
      sum += factorial(1);
      break;
    case '2':
      sum += factorial(2);
      break;
    case '3':
      sum += factorial(3);
      break;
    case '4':
      sum += factorial(4);
      break;
    case '5':
      sum += factorial(5);
      break;
    case '6':
      sum += factorial(6);
      break;
    case '7':
      sum += factorial(7);
      break;
    case '8':
      sum += factorial(8);
      break;
    case '9':
      sum += factorial(9);
      break;
    default:
      assert(false);
      break;
    }
  }

  return sum;
}

int main() {
  assert(factorial(0) == 1);
  assert(factorial(1) == 1);
  assert(factorial(3) == 6);
  assert(factorial(9) == 362880);
  // (* 7 362880) 2540160
  int64_t sum = 0;

  for (auto i = 3; i <= 2540160; ++i) {
    if (i == sumOfFactorialsOfDigits(i)) {
      sum += (int64_t)i;
    }
  }

  std::cout << sum << std::endl;
}


/* Compilation Instructions (by compiler):
   Visual C++: cl /EHsc 034.cpp
   Clang:      clang++ -std=c++11 034.cpp
   GCC:        g++ -std=c++11 034.cpp
*/

/* Visual C++ Testing:
~/Projects/Project-Euler-Solutions $ cl /EHsc 034.cpp 
Microsoft (R) C/C++ Optimizing Compiler Version 19.10.25019 for x64
Copyright (C) Microsoft Corporation.  All rights reserved.

034.cpp
Microsoft (R) Incremental Linker Version 14.10.25019.0
Copyright (C) Microsoft Corporation.  All rights reserved.

/out:034.exe 
034.obj 
~/Projects/Project-Euler-Solutions $ 034.exe
40730
*/

/* Clang and GCC testing (msys2)
ps@DESKTOP-8FU6LQ7 MINGW64 ~/Projects/Project-Euler-Solutions
$ g++ -std=c++11 034.cpp

ps@DESKTOP-8FU6LQ7 MINGW64 ~/Projects/Project-Euler-Solutions
$ ./a.exe
40730

ps@DESKTOP-8FU6LQ7 MINGW64 ~/Projects/Project-Euler-Solutions
$ g++ -v
Using built-in specs.
COLLECT_GCC=C:\msys64\mingw64\bin\g++.exe
COLLECT_LTO_WRAPPER=C:/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/6.3.0/lto-wrapper.exe
Target: x86_64-w64-mingw32
Configured with: ../gcc-6.3.0/configure --prefix=/mingw64 --with-local-prefix=/mingw64/local --build=x86_64-w64-mingw32 --host=x86_64-w64-mingw32 --target=x86_64-w64-mingw32 --with-native-system-header-dir=/mingw64/x86_64-w64-mingw32/include --libexecdir=/mingw64/lib --enable-bootstrap --with-arch=x86-64 --with-tune=generic --enable-languages=c,lto,c++,objc,obj-c++,fortran,ada --enable-shared --enable-static --enable-libatomic --enable-threads=posix --enable-graphite --enable-fully-dynamic-string --enable-libstdcxx-time=yes --disable-libstdcxx-pch --disable-libstdcxx-debug --disable-isl-version-check --enable-lto --enable-libgomp --disable-multilib --enable-checking=release --disable-rpath --disable-win32-registry --disable-nls --disable-werror --disable-symvers --with-libiconv --with-system-zlib --with-gmp=/mingw64 --with-mpfr=/mingw64 --with-mpc=/mingw64 --with-isl=/mingw64 --with-pkgversion='Rev2, Built by MSYS2 project' --with-bugurl=https://sourceforge.net/projects/msys2 --with-gnu-as --with-gnu-ld
Thread model: posix
gcc version 6.3.0 (Rev2, Built by MSYS2 project)

ps@DESKTOP-8FU6LQ7 MINGW64 ~/Projects/Project-Euler-Solutions
$ clang++ -std=c++11 034.cpp

ps@DESKTOP-8FU6LQ7 MINGW64 ~/Projects/Project-Euler-Solutions
$ ./a.exe
40730

ps@DESKTOP-8FU6LQ7 MINGW64 ~/Projects/Project-Euler-Solutions
$ clang++ -v
clang version 3.9.1 (tags/RELEASE_391/final)
Target: x86_64-w64-windows-gnu
Thread model: posix
InstalledDir: C:\msys64\mingw64\bin

*/
