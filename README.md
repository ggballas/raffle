# Raffle smart contract

A smart contract used to prove that the organizer of a raffle chooses the winner randomly (cannot cheat and choose a winner that they prefer).

The contract is very simple.

## Initialize raffle
Initialize the raffle by deploying the Raffle contract with a link to a file containing all the options and the number of options there are.

For example, if we'd like to create a raffle between three contestants - Alice, Bob, and Carol, we'd initialize the contract like so:

`Raffle.deploy(linkToOptionsFile, 3)`

The options file could look something like this:
```
Alice
Bob
Carol
```

## Choose a winner (or winners)
Simply call:
`raffleInstance.chooseOption()`

This will return a random number between 0 and 2 (0 being Alice, 1 is Bob, 2 is Carol) which indicates who won. It will also emit an event.

You may call this function as many times as you'd like. However, every time this function is called it will be stored in the blockchain!