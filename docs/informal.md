Informal specification
======================

*Keywords:* domain event, decision, proposal, vote, ballot, influence, resolution, resolution outcome, population, 
registry, regid

---------------------------------------------------------------------------------------------------------------------------

*Domain events:* Events to which the system listens to, for each event a decision process gets triggered, this 
decision process might be different for each individual event.

*Decision process:* a smart contract that keeps the state of a decision for one domain event:
	Receive event (contract creation ?) -> 
	request population snapshot to the registry -> 
	Stage(t): Request for proposals -> 
	Stage(t): Votes collection ->
	Stage(dr): Decision resolution ->
	Decision resolution operation

*Registry(alloc):* Smart contract or database which keeps a population state, this includes the method of allocation of 
influence to each member of the population.

*Population:* Set of addresses (members) which may participate on a given decision process.

*Population Snapshot:* Population state on a given moment of time.

*Pre defined proposal set:* If set, no request for proposal stage is executed, and the votes collection stage starts
inmediately with a predefined set of proposals. 

*Stage(time) Request for proposals:* Parametrised by time to live, the contract collects decision options, for which members
can allocate their influence on (which might be calls to other contracts) at the votes collection stage. Once the
amount of time to live has passed, the next stage starts.

*Proposa:* Description of the proposal together with a decision operation.

*Member voting:* The act of a member to assign his limited (and infinitodecimal) amount of influence on one or
multiple proposals.

*Stage(time) Votes collection:* Parametrised by time to live, the contract accepts and accumulates valid votes from members 
which are within the population snapshot. Once the amount of time to live has passed, the next stage starts.

*Stage(decision_resolution) Decision resolution:* Parametrised by a decision resolution function, as soon as this stage
is triggered, the ballot is locked and the final decision is resolved, triggering the decision program calls.

*Decisions sequencing:* The resolution of a decision can trigger a new domain event, consequentially triggering a 
new decisicion process.

*Founder:* First address which creates a community.

*Binary decision:* Decision with pre defined proposal set {yes, no}.

*Decision resolution operation:* a set of predefined operations that might come out of a decision
