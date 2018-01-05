pragma solidity ^0.4.18;


/**
 * @title StaticMultiOwnable
 * @author  Kirill Varlamov <kirill@ongrid.pro>
 * @dev The StaticMultiOwnable contract has a statically initialized on creation
 * mapping of owners and provides basic authorization control similar to
 * OpenZeppelin's 'Ownable' pattern
 */
contract StaticMultiOwnable {

    mapping (address => bool) public owners;
    
    /**
     * @dev The StaticMultiOwnable constructor builds associative array of owners 
     * taking dynamical-sized array of addresses.
     */
    function StaticMultiOwnable(address[] addresses_) internal {
        for (uint i = 0; i < addresses_.length; i++) {
            owners[addresses_[i]] = true;
        }
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owners[msg.sender]);
        _;
    }
}
