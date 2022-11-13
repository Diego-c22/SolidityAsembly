// SPDX-License-Identifier: MIT
pragma solidity 0.8.17

/********************************************************/
/*  In Yul only exits bytes32 data type. All the others */
/*  data types are just a representation.               */
/*  E.g.                                                */
/* bytes32 = 1                                          */
/* address = 0x00000000...0001                          */
/* uint = 00...01                                       */
/* bool = true                                          */
/********************************************************/

contract YulTypes {

    // We use the sign ":=" to use equal
    function getNumber() external view returns (uint256 x) {
      assembly {
        x := 42
      }
    }

    function demoString() external pure returns (string memory) {
      // We use bytes32 because string is not a native type and it doesn't exist in Yul
      bytes32 myString = ""

      assembly {
        myString := "heelo world"
      }
      
      // We have to parse to string if we don't want to get the HEX representation.
      return string(abi.encode(myString));
    }
}