pragma solidity ^0.4.23;
import "./Ballot.sol";

contract Registry {

  address public founder;

  address[] public oligarchy;

  address[] public population;

  mapping(address => uint) public reputation;

  address[] public activeDecisions;

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
    ADD_MEMBER,
    PROMOTE
  }

  constructor() public {
    founder = msg.sender;
    oligarchy.push(msg.sender);
    population.push(msg.sender);
  }

  /* ---------*/
  /* Decision */
  /* ---------*/

  function decide(
    string description,
    InfluenceDistribution distribution,
    DecisionResolution resolution,
    DecisionType operation
  ) public returns (address) {
    Ballot ballot = new Ballot(this);
    activeDecisions.push(ballot);
    return address(ballot);
  }

  function resolve() public {

    Decision memory decision = activeDecisions[msg.sender];
    uint[] memory influence = new uint[](population.length);

    if (decision.distribution == InfluenceDistribution.AUTOCRATIC) {
      autocratic(influence);
    } else if (decision.distribution == InfluenceDistribution.OLIGARCHIC) {
      oligarchic(influence);
    } else if (decision.distribution == InfluenceDistribution.MERITOCRATIC) {
      meritocratic(influence);
    } else if (decision.distribution == InfluenceDistribution.DEMOCRATIC) {
      democratic(influence);
    }

    delete activeDecisions[msg.sender];
  }

  /* -------------------------------- */
  /* Influence distribution functions */
  /* -------------------------------- */

  function autocratic(uint[] influence) private view {
    for (uint i; i < population.length; i++) {
      address member = population[i];
      if (member == founder) influence[i] = 1;
      else influence[i] = 0;
    }
  }

  function oligarchic(uint[] influence) private view {
    for (uint i; i < population.length; i++) {
      address member = population[i];
      bool isWithinOligarchy = false;
      for(uint j = 0; i < oligarchy.length; i++) {
        if (oligarchy[j] == member) isWithinOligarchy = true;
      }
      if (isWithinOligarchy) influence[i] = 1;
      else influence[i] = 0;
    }
  }

  function meritocratic(uint[] influence) private view {
    for (uint i; i < population.length; i++) {
      address member = population[i];
      influence[i] = reputation[member];
    }
  }

  function democratic(uint[] influence) private view {
    for (uint i; i < population.length; i++) {
      influence[i] = 1;
    }
  }

  /* -------------------------- */
  /* Binary decision resolution */
  /* -------------------------- */

  function majority(uint[] influence, bool[] votes) private view returns (bool) {
    uint yes = 0;
    uint no = 0;
    for (uint i; i < population.length; i++) {
      bool vote = votes[i];
      if (vote) {
        yes += influence[i];
      } else {
        no += influence[i];
      }
    }
    return yes > no;
  }

  /* ------------------------------ */
  /* Decision resolution operations */
  /* ------------------------------ */

  function addMember(address member) private {
    population.push(member);
  }

  function promote(address member) private {
    oligarchy.push(member);
  }
}
