// SPDX-License-Identifier: MIT
pragma solidity 0.8.17

contract IfComparison {
    function isTruthy() external pure returns (uint256 result) {
      result = 2;
      assembly {
        // True if the valus contain a number that isn't zero in the bytes32
        if 2 {
          result := 1
        }
      }
      return result; // returns 1
    }

    function isFalsy() external pure returns (uint256 result) {
      result = 1;
      assembly {
        // False is equals to 32 bytes as zero in bytes32
        if 0 {
          result := 2
        }
      }
      return result; // returns 1
    }

    function negation() external pure returns (uint256 result) {
        result = 1;
        assembly {
          // if the value is zero it retuns true
          if iszero(0) {
            result := 2
          }
        }

      return result; // returns 2
    }

    function unsafeNegationPart1() external pure returns (uint256 result) {
      result = 1;

      assembly {
        // This function flip all of the bits. if all the bytes in bytes32 are all 1
        // or are all 0 it works, if not it would give you a non zero value
        if not(0) {
          result := 2
        }
      }

      return result; // returns 2
    }
}