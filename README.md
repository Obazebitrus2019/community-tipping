Community Tipping Smart Contract

The **Community Tipping Smart Contract** is a Clarity-based solution built on the **Stacks blockchain** that enables decentralized **peer-to-peer tipping**.  
It allows users to reward others with small STX token contributions ("tips") for valuable actions, services, or community participation — promoting a culture of appreciation and engagement.

---

Features

- 💰 **Peer-to-Peer Tipping** — Instantly send STX tokens as tips to other community members.  
- 🧾 **Transparent Records** — Each tipping transaction is logged on-chain for full transparency.  
- 🧍 **User Activity Tracking** — Retrieve total tips received or sent by any address.  
- 🔒 **Secure & Trustless** — Validates balances, prevents self-tipping, and ensures safe token transfers.  
- ⚙️ **Lightweight Design** — Minimal gas cost and easy to integrate with other dApps or community platforms.  

---

Contract Overview

| Function | Description |
|-----------|--------------|
| `tip(recipient, amount)` | Sends a tip to another user on the network. |
| `get-total-tips(recipient)` | Returns the total STX amount received by a user. |
| `get-user-history(sender)` | Lists all tips sent by a particular wallet address. |

---

Technical Details

- **Language:** [Clarity](https://docs.stacks.co/write-smart-contracts/clarity)  
- **Contract Name:** `community-tipping.clar`  
- **Blockchain:** [Stacks Network](https://stacks.co)  
- **Dependencies:** None  
- **Security Measures:**  
  - Prevents self-tipping  
  - Ensures sender has sufficient balance  
  - Logs all tipping activities for transparency  

---

Testing

To run tests for this contract using [Clarinet](https://github.com/hirosystems/clarinet):

```bash
clarinet test
