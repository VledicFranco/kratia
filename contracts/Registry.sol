pragma solidity ^0.4.23;

contract Registry {

  address founder;

  address[] oligarchy;

  address[] population;

  mapping(address => ufixed) reputation;

  enum InfluenceDistribution {
    AUTOCRATIC,
    OLIGARCHIC,
    MERITOCRATIC,
    DEMOCRATIC
  }

  enum DecisionResolution {
    MAJORITY,
    UNANIMITY
  }

  enum DecisionType {
    DECIDE_ADD_MEMBER,
    DECIDE_PROMOTE
  }

  enum DecisionOperation {
    OP_ADD_MEMBER,
    OP_PROMOTE
  }

  struct Decision {
    string description;
    DecisionType type;
    DecisionOperation operation;
  }

  constructor() public {
    founder = msg.sender;
    oligarchy.push(msg.sender);
    population.push(msg.sender);
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

  /* ------------------- */
  /* Decision resolution */
  /* ------------------- */



  /* -------------- */
  /* Decision types */
  /* -------------- */

  function decide(string description, Decision decision) public returns (address) {

  }

  /* ------------------------------ */
  /* Decision resolution operations */
  /* ------------------------------ */

  event DecisionMade(string description);

  function addMember(address member) internal {
    population.push(member);
  }

  function promote(address member) internal {
    oligarchy.push(member);
  }
}
