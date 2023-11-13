//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

//user inputs 10 numbers, separated by commas and they are output in 
//order of smallest to greatest
contract Sort {

    //An array is initialized
    uint256[5] public arr;

    //User inputs 5 positive numbers which are put into an array
    function inputNumbers(uint256 a, uint b, uint c, uint d, uint e) public {
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
    }

    //Allows user to see what numbers are in the array
    function retrieve() public view returns(uint, uint, uint, uint, uint) {
        return (arr[0], arr[1], arr[2], arr[3], arr[4]);
    }

    //checks if the numbers given are in order from smallest to largest
    function inOrder() public view returns (bool) {
        bool order = true;

        uint i = 0;
        uint j = 1;

        for (j; j < 5; j++) {
            if(arr[j] < arr[i]) {
                order = false;
            }
            i++;
        }

        return order;

    }

    //insertion sort
    //sorts the numbers in the array from smallest to largest
    //this function costs a lot of gas to do in a smart contract
    function sort() public {

        uint length = arr.length;
            for (uint i = 1; i < length; i++) {
                uint key = arr[i];
                int j = int(i) - 1;
                while ((int(j) >= 0) && (arr[uint(j)] > key)) {
                    arr[uint(j + 1)] = arr[uint(j)];
                    j--;
                }
                arr[uint(j + 1)] = key;
            }
    }


}
