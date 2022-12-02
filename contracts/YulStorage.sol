// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

// Slot: Memory Location

contract StorageBasics {
    uint256 x; // Slot 0
    uint256 y; // Slot 1

    // Slots have as maximum 256 bits, but if you use a variable that doesn't need
    // all the space, the next variable will be saved in the same slot packed
    // E.g.
    uint128 a; // Slot 2 first 1/2
    uint128 b; // Slot 2 second 1/2

    uint128 public A = 4; // Slot 3 1/2
    uint96 public B = 5; // Slot 3 1/4
    uint16 public C = 6; // Slot 3 1/16
    uint8 public D = 7; // Slot 3 1/32
    uint8 public E = 8; // Slot 3 1/32

    function getXYul() external view returns (uint256 ret) {
        // x.slot: returns the location where x is saved
        // sload: get the value saved in a specific location
        assembly {
            ret := sload(x.slot)
        }
    }

    function setXYul(uint256 newVal) external {
        // sstore: save a value in a specific location (slot, value)
        assembly {
            sstore(x.slot, newVal)
        }
    }

    function getSlotOffset()
        external
        view
        returns (uint256 offset, uint256 slot)
    {
        assembly {
            offset := A.offset
            slot := A.slot
        }
    }
}
