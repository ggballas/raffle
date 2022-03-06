//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Raffle is Ownable {

    string public optionsFile;
    uint256 public numberOfOptions;
    uint256 public numberOfTimesOptionChosen;

    // id is simply incrementing (first option chosen will have id==0, second will have id==1 and so on..)
    event OptionChosen(uint256 id, uint256 optionNumber);

    constructor(
        string calldata _ipfsOptionsFile,
        uint256 _numberOfOptions
    ) {
        ipfsOptionsFile = _ipfsOptionsFile;
        numberOfOptions = _numberOfOptions;
        numberOfTimesRandNumWasGenerated = 0;
    }

    /**
        Call this function to *randomly* choose a number in the range 0 to numberOfOptions.
     */
    function chooseOption() public onlyOwner {
        uint256 seed = uint256(keccak256(abi.encodePacked(
            block.timestamp + block.difficulty +
            ((uint256(keccak256(abi.encodePacked(block.coinbase)))) / (now)) +
            block.gaslimit + 
            ((uint256(keccak256(abi.encodePacked(msg.sender)))) / (now)) +
            block.number
        )));

        uint256 chosenOption = seed % numberOfOptions;

        emit OptionChosen(numberOfTimesOptionChosen, chosenOption);

        numberOfTimesOptionChosen += 1;

        return chosenOption;
    }

    /**
     * Generate a random number between 0-999.
     */
    function rand() private view returns(uint256) {
        uint256 seed = uint256(keccak256(abi.encodePacked(
            block.timestamp + block.difficulty +
            ((uint256(keccak256(abi.encodePacked(block.coinbase)))) / (now)) +
            block.gaslimit + 
            ((uint256(keccak256(abi.encodePacked(msg.sender)))) / (now)) +
            block.number
        )));

        return (seed - ((seed / 1000) * 1000));
    }
}