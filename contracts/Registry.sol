pragma solidity ^0.4.23;

contract Registry {

  address founder;

  address[] oligarchy;

  address[] population;

  mapping(address => ufixed) reputation;

  function (address) internal pure (ufixed) allocators;

  mapping(uint => bool) enabledAllocators;

  constructor() public {
    founder = msg.sender;
  }

  /* -------------------------------- */
  /* Influence distribution functions */
  /* -------------------------------- */

  function autocratic(address member) private pure returns (ufixed) {
    if (member == founder) 1.0;
    else 0.0;
  }

  function oligarchic(address member) private pure returns (ufixed) {
    for(uint i = 0; i < oligarchy.length; i++) {
      if (oligarchy[i] == member) return 1.0;
    }
    return 0.0;
  }

  function meritocratic(address member) private pure returns (ufixed) {
    return reputation[member];
  }

  function democratic(address member) private pure returns (ufixed) {
    return 1.0;
  }

  function makeDecision() public

  // getSnapshot(method) internal
  //  * should get the population snapshot with correct influence allocation

  // addMember
  //  * should only be result of a decision between admins
  function addMember()

  // promoteToAdmin
  //  * should only be result of a decision
}
