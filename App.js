import { useState, useEffect } from 'react';
import { ethers } from 'ethers';
import Crowdfunding from './contracts/Crowdfunding.json';

function App() {
  const [campaigns, setCampaigns] = useState([]);
  const [provider, setProvider] = useState(null);
  const [contract, setContract] = useState(null);

  useEffect(() => {
    if (window.ethereum) {
      const provider = new ethers.providers.Web3Provider(window.ethereum);
      setProvider(provider);

      const contractAddress = "YOUR_CONTRACT_ADDRESS";
      const contract = new ethers.Contract(contractAddress, Crowdfunding.abi, provider.getSigner());
      setContract(contract);
    } else {
      console.log("Please install MetaMask");
    }
  }, []);

  const createCampaign = async (title, description, goal, duration) => {
    const tx = await contract.createCampaign(title, description, ethers.utils.parseEther(goal), duration);
    await tx.wait();
  };

  const pledgeFunds = async (campaignId, amount) => {
    const tx = await contract.pledgeFunds(campaignId, { value: ethers.utils.parseEther(amount) });
    await tx.wait();
  };

  const withdrawFunds = async (campaignId) => {
    const tx = await contract.withdrawFunds(campaignId);
    await tx.wait();
  };

  const getCampaigns = async () => {
    const campaigns = await contract.getCampaigns();
    setCampaigns(campaigns);
  };

  return (
    <div>
      <h1>Decentralized Crowdfunding DApp</h1>
      {/* UI for creating campaign, pledging funds, and managing campaigns */}
    </div>
  );
}

export default App;
