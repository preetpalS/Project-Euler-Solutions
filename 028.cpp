
#include <array>
#include <cstdint>
#include <iostream>
#include <memory>
#include <type_traits>

// This class is not really necessary as this problem could have been solved with a loop.
template <typename T, int X>
class SpriralGrid {
  static_assert(std::is_integral<T>::value, "Integral type required.");
  static_assert((X % 2 == 1), "X must be odd.");

public:

  SpriralGrid<T, X>() : _array(new std::array<std::array<T, X>, X>()) {
    this->populate_grid();
  }

  T sum_of_numbers_on_diagonal() {
    T sum = 0;
    for (int index = 0; index < X; index++) {
      int opposite_diagonal_index = X - index - 1;

      if (opposite_diagonal_index == index) {
        sum = sum + (*this->_array)[index][index];
      } else {
        sum = sum + (*this->_array)[index][index] + (*this->_array)[index][opposite_diagonal_index];
      }
    }
    return sum;
  }

private:

  std::unique_ptr<std::array<std::array<T, X>, X>> _array;

  // Cheating by only populating diagonals
  void populate_grid() {
    int midpoint = X / 2;
    int numberOfCoils = midpoint;
    int coilWidth = 1;

    (*this->_array)[midpoint][midpoint] = 1;

    for (int i = 1; i <= numberOfCoils; i++) {
      coilWidth = coilWidth + 2;
      (*this->_array)[midpoint + i][midpoint + i] = (coilWidth * coilWidth) - (3 * (coilWidth - 1));
      (*this->_array)[midpoint + i][midpoint - i] = (coilWidth * coilWidth) - (2 * (coilWidth - 1));
      (*this->_array)[midpoint - i][midpoint - i] = (coilWidth * coilWidth) - (1 * (coilWidth - 1));
      (*this->_array)[midpoint - i][midpoint + i] = (coilWidth * coilWidth) - (0 * (coilWidth - 1));
      // std::cout << coilWidth << ": " << (coilWidth * coilWidth) << std::endl;
    }
  }
};

int main() {
  auto grid = SpriralGrid<int64_t, 1001>();
  std::cout << grid.sum_of_numbers_on_diagonal() << std::endl; // 669171001
}

/*
C:\ProjectEulerSolutions>cl /EHsc 028.cpp
Microsoft (R) C/C++ Optimizing Compiler Version 19.00.24215.1 for x64
Copyright (C) Microsoft Corporation.  All rights reserved.

028.cpp
Microsoft (R) Incremental Linker Version 14.00.24215.1
Copyright (C) Microsoft Corporation.  All rights reserved.

/out:028.exe
028.obj

C:\ProjectEulerSolutions>028.exe
669171001

*/
