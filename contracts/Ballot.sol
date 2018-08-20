pragma solidity ^0.4.23;
import "./Registry.sol";

contract Ballot {

  Registry registry;

  mapping(address => bool) public votes;

  constructor (Registry _registry) public {
    registry = _registry;
  }
}