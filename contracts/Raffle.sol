//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Raffle is Ownable {

    string public optionsFile;
    uint256 public numberOfOptions;
    uint256 public numberOfTimesOptionChosen;

    // id is simply incrementing (first option chosen will have id==0, second will have id==1 and so on..)
    event OptionChosen(uint256 id, uint256 optionNumber);

    constructor(
        string memory _optionsFile,
        uint256 _numberOfOptions
    ) {
        optionsFile = _optionsFile;
        numberOfOptions = _numberOfOptions;
        numberOfTimesOptionChosen = 0;
    }

    /**
        Call this function to *randomly* choose a number in the range 0 to numberOfOptions.
     */
    function chooseOption() public onlyOwner returns (uint256) {
        uint256 seed = uint256(keccak256(abi.encodePacked(
            block.timestamp + block.difficulty +
            ((uint256(keccak256(abi.encodePacked(block.coinbase)))) / (block.timestamp)) +
            block.gaslimit + 
            ((uint256(keccak256(abi.encodePacked(msg.sender)))) / (block.timestamp)) +
            block.number
        )));

        uint256 chosenOption = seed % numberOfOptions;

        emit OptionChosen(numberOfTimesOptionChosen, chosenOption);

        numberOfTimesOptionChosen += 1;

        return chosenOption;
    }
}