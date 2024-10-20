// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfunding {
    struct Campaign {
        address payable creator;
        string title;
        string description;
        uint goal;
        uint pledged;
        uint deadline;
        bool isCompleted;
        mapping(address => uint) contributions;
    }

    Campaign[] public campaigns;

    event CampaignCreated(uint campaignId, address creator, string title, uint goal, uint deadline);
    event FundPledged(uint campaignId, address contributor, uint amount);
    event FundWithdrawn(uint campaignId, address creator);

    function createCampaign(string memory _title, string memory _description, uint _goal, uint _duration) public {
        Campaign storage newCampaign = campaigns.push();
        newCampaign.creator = payable(msg.sender);
        newCampaign.title = _title;
        newCampaign.description = _description;
        newCampaign.goal = _goal;
        newCampaign.pledged = 0;
        newCampaign.deadline = block.timestamp + _duration;
        newCampaign.isCompleted = false;

        emit CampaignCreated(campaigns.length - 1, msg.sender, _title, _goal, newCampaign.deadline);
    }

    function pledgeFunds(uint _campaignId) public payable {
        Campaign storage campaign = campaigns[_campaignId];
        require(block.timestamp < campaign.deadline, "Campaign has ended");
        require(msg.value > 0, "You must pledge more than 0");

        campaign.pledged += msg.value;
        campaign.contributions[msg.sender] += msg.value;

        emit FundPledged(_campaignId, msg.sender, msg.value);
    }

    function withdrawFunds(uint _campaignId) public {
        Campaign storage campaign = campaigns[_campaignId];
        require(msg.sender == campaign.creator, "Only the creator can withdraw");
        require(block.timestamp >= campaign.deadline, "Campaign is still ongoing");
        require(campaign.pledged >= campaign.goal, "Funding goal not reached");
        require(!campaign.isCompleted, "Funds already withdrawn");

        campaign.isCompleted = true;
        campaign.creator.transfer(campaign.pledged);

        emit FundWithdrawn(_campaignId, campaign.creator);
    }

    function getRefund(uint _campaignId) public {
        Campaign storage campaign = campaigns[_campaignId];
        require(block.timestamp >= campaign.deadline, "Campaign is still ongoing");
        require(campaign.pledged < campaign.goal, "Funding goal was reached");
        require(campaign.contributions[msg.sender] > 0, "You did not contribute");

        uint refundAmount = campaign.contributions[msg.sender];
        campaign.contributions[msg.sender] = 0;
        payable(msg.sender).transfer(refundAmount);
    }

    function getCampaigns() public view returns (Campaign[] memory) {
        return campaigns;
    }
}
