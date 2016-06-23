
#include <iostream>
#include <stdexcept>
#include <string>

std::string numberToWord(int i) {
  if (i < 1 || i > 1000)
    throw std::runtime_error("`std::string numberToWord(int)` ot implemented "
                             "for value outside of range: [1, 1000]");

  if (i < 10) {
    switch (i) {
    case 1:
      return "one";
    case 2:
      return "two";
    case 3:
      return "three";
    case 4:
      return "four";
    case 5:
      return "five";
    case 6:
      return "six";
    case 7:
      return "seven";
    case 8:
      return "eight";
    case 9:
      return "nine";
    }
  } else if (i < 100) {
    std::string accum;
    int firstPart = i / 10;
    switch (firstPart) {
    case 1:
      switch (i - 10) {
      case 0:
        return "ten";
      case 1:
        return "eleven";
      case 2:
        return "twelve";
      case 3:
        return "thirteen";
      case 4:
        return "fourteen";
      case 5:
        return "fifteen";
      case 6:
        return "sixteen";
      case 7:
        return "seventeen";
      case 8:
        return "eighteen";
      case 9:
        return "nineteen";
      }
    case 2:
      accum = std::string("twenty");
      break;
    case 3:
      accum = std::string("thirty");
      break;
    case 4:
      accum = std::string("forty");
      break;
    case 5:
      accum = std::string("fifty");
      break;
    case 6:
      accum = std::string("sixty");
      break;
    case 7:
      accum = std::string("seventy");
      break;
    case 8:
      accum = std::string("eighty");
      break;
    case 9:
      accum = std::string("ninety");
      break;
    }
    if (i % 10 != 0) {
      return accum + "-" + numberToWord(i % 10);
    } else {
      return accum;
    }
  } else if (i < 1000) {
    std::string accum;
    int firstPart = i / 100;
    switch (firstPart) {
    case 1:
      accum = numberToWord(firstPart) + std::string(" hundred");
      break;
    case 2:
      accum = numberToWord(firstPart) + std::string(" hundred");
      break;
    case 3:
      accum = numberToWord(firstPart) + std::string(" hundred");
      break;
    case 4:
      accum = numberToWord(firstPart) + std::string(" hundred");
      break;
    case 5:
      accum = numberToWord(firstPart) + std::string(" hundred");
      break;
    case 6:
      accum = numberToWord(firstPart) + std::string(" hundred");
      break;
    case 7:
      accum = numberToWord(firstPart) + std::string(" hundred");
      break;
    case 8:
      accum = numberToWord(firstPart) + std::string(" hundred");
      break;
    case 9:
      accum = numberToWord(firstPart) + std::string(" hundred");
      break;
    }
    if (i % 100 != 0)
      return accum + std::string(" and ") + numberToWord(i % 100);
    else
      return accum;
  } else {
    return "one thousand";
  }
}

int main() {
  int count = 0;
  for (int i = 1; i <= 1000; ++i) {
    std::string word = numberToWord(i);
    std::cout << i << ": " << word << std::endl;
    for (auto c : word)
      if (' ' != c || '-' != c)
        count = count + 1;
  }

  // Solution: 21124
  std::cout << count << std::endl;
}
