pragma solidity ^0.4.23;
import "./Registry.sol";

contract Ballot {

  Registry public registry;

  string public description;

  Registry.InfluenceDistribution public distribution;

  Registry.DecisionResolution public resolution;

  Registry.DecisionType public operation;

  bool public stageVoting;

  uint public dateOfBirth;

  mapping(address => bool) public votes;

  constructor (
    Registry _registry,
    string _description,
    InfluenceDistribution _distribution,
    DecisionResolution _resolution,
    DecisionType _operation
  ) public {
    registry = _registry;
    stageVoting = true;
    dateOfBirth = block.number;
  }

  //function vote(v: bool) public

  //function resolve
}
