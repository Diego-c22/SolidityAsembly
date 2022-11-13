// SPDX-License-Identifier: MIT
pragma solidity 0.8.17

contract IsPrime {
  function isPrime(uint256 x) public pure returns (bool p) {
    p = true;

    assembly {
      let halfX := add(div(x, 2), 1)
      //  INITIALIZING  -   STOP      -   UPDATING
      for { let i := 2 } lt(i,  halfX) { i := add(i, 1) }
      // Block to execute in each interaciton
      {
        if iszero(mod(x, i)) {
          p := 0
          break
        }
      }
    }
  }
}