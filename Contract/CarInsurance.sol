// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CarInsuranceContract {
    address public insurer;
    
    // Struct to store policy details
    struct Policy {
        address policyholder;
        uint256 premium;
        uint256 coverageLimit;
        uint256 startDate;
        uint256 endDate;
        bool isActive;
    }
    
    // Mapping to store policies
    mapping(uint256 => Policy) public policies;
    uint256 public policyCounter;

    // Modifier to restrict access to certain functions
    modifier onlyInsurer() {
        require(msg.sender == insurer, "Only insurer can call this function");
        _;
    }

    constructor() {
        insurer = msg.sender;
    }

    /**
     * @notice assumes that the insurer is the caller of the function
     * @dev function to creates a insurance policy
     */
    function createPolicy(
        address policyholder,
        uint256 premium,
        uint256 coverageLimit,
        uint256 startDate,
        uint256 endDate
    ) external onlyInsurer {
        policies[policyCounter] = Policy({
            policyholder: policyholder,
            premium: premium,
            coverageLimit: coverageLimit,
            startDate: startDate,
            endDate: endDate,
            isActive: true
        });
        policyCounter++;
    }

   /**
     * @dev function to calculate Premium
     */
    function calculatePremium(uint256 coverageLimit) internal pure returns (uint256) {
     
    }

     /**
     * @notice assumes that the insurer is the caller of the function
     * @dev function to renew insurance policy
     */
    function renewPolicy(uint256 policyId, uint256 newEndDate) external onlyInsurer {
        require(policies[policyId].isActive, "Policy is not active");
        policies[policyId].endDate = newEndDate;
    }

}