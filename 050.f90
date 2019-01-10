
program projectEulerProblem50Solution
  implicit none
  integer, parameter :: primesArrayLength = 78498 ! The 78,499th prime (1,000,003) is the first prime over 1,000,000
  integer, dimension(primesArrayLength) :: primes

  call populatePrimesArray(primes)

  print "(i6)", findLongestConsecutivePrimeSum(primes)

contains
  ! Finds longest sum of consecutive primes that adds to a prime below one-million
  integer function findLongestConsecutivePrimeSum(primes) result(solution)
    implicit none
    integer, intent(in) :: primes(primesArrayLength)
    integer :: index, prime, sumLength, longestSumLength, tempSum, i, j

    solution = 0
    longestSumLength = 0
    do index = 1,primesArrayLength
       prime = primes(index)

       do i = 1,(index - 1)
          sumLength = 0
          tempSum = 0
          j = i

          do while ((j <= primesArrayLength) .and. (tempSum < prime))
             tempSum = tempSum + primes(j)
             j = j + 1
          end do

          sumLength = j - i + 1
          if ((tempSum == prime) .and. (sumLength > longestSumLength)) then
             longestSumLength = sumLength
             solution = prime
          end if
       end do
    end do
  end function findLongestConsecutivePrimeSum

  subroutine populatePrimesArray(primes)
    implicit none
    integer, intent(out) :: primes(primesArrayLength)
    integer :: index, i, tmp
    logical :: temp

    ! populate primes array
    primes(1) = 2
    primes(2) = 3
    do index = 3,primesArrayLength
       tmp = primes(index - 1) + 2
       call isPrime(tmp, temp)

       do while (.not. temp)
          tmp = tmp + 2
          call isPrime(tmp, temp)
       end do

       primes(index) = tmp
    end do
  end subroutine populatePrimesArray

  subroutine isPrime(n, res)
    implicit none
    integer, intent(in) :: n
    logical, intent(out) :: res
    integer :: i, z

    if (n < 2) then
       res = .false.
    else if (n < 4) then
       res = .true.
    else if (MOD(n, 2) == 0) then
       res = .false.
    else

       z = CEILING(SQRT(REAL(n)))
       do i = 2,z
          if (MOD(n, i) == 0) then
             res = .false.
             return
          end if
       end do
       res = .true.
    end if
  end subroutine isPrime
end program projectEulerProblem50Solution


! C:\Project-Euler-Solutions>gfortran -O2 -o 050.exe 050.f90
!
! C:\Project-Euler-Solutions>050.exe
! 997651
!
! C:\Project-Euler-Solutions>


! Problem description (from projecteuler.net (https://projecteuler.net/problem=50); please visit the site and donate to it if you find it useful)
! Consecutive prime sum
! Problem 50
!
! The prime 41, can be written as the sum of six consecutive primes:
! 41 = 2 + 3 + 5 + 7 + 11 + 13
! This is the longest sum of consecutive primes that adds to a prime below one-hundred.
! The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
! Which prime, below one-million, can be written as the sum of the most consecutive primes?
