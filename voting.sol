pragma solidity ^0.4.24;
// We have to specify what version of compiler this code will compile with


contract Voting {

    /* mapping field below is equivalent to an associative array or hash.
    The key of the mapping is candidate name stored as type bytes32 and value is
    an unsigned integer to store the vote count aka: (key value pair)*/
    mapping (bytes32 => uint8) public votesReceived;

    /* Solidity doesn't allow you to pass in an array of strings in the constructor
    (yet). We will use an array of bytes32 instead to store the list of candidates.*/
    bytes32[] public candidatesList;

    /* This is the constructor that will be called once we deploy the contract
    to the blockchain. When we deploy the contract, we will pass an array of
    candidates in the election.*/
    constructor(bytes32[] candidateNames) {
        candidatesList = candidateNames;
    }

    // This function returns the total votes a candidate has reveived so far.
    function  totalVotesFor(bytes32 candidate) returns (uint8) {
        if (validCandidate(candidate) == false) revert();
        return votesReceived[candidate];
    }

    /* This function increments the vote count for the specifies candidate.
    Equivalent to casting a vote. */
    function voteForCandidate(bytes32 candidate) {
        if (validCandidate(candidate) == false) revert();
        votesReceived[candidate] += 1;
    }

    // Validates if a candidate is valid
    function validCandidate(bytes32 candidate) returns (bool) {
        for(uint i = 0; i < candidatesList.length; i++) {
            if (candidatesList[i] == candidate) {
                return true;
            }
        }
        return false;
    }
}
