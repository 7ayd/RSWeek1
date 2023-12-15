ERC777 and ERC 1363 are token standards that give tokens extra functionality to ERC20s while being backwards (somewhat) compatiable.

ERC777
Problems Solved:

Hook Mechanism: ERC777 introduced a hook mechanism that allows smart contracts to react to token transactions. This means a contract can execute additional logic when it receives or sends tokens, which was not possible with ERC20.

Improved User Experience: ERC777 tokens can be sent to both externally owned accounts and contracts with a single transaction type, simplifying interactions for users.

Advanced Token Control: It allows token holders more control over their tokens, providing a more advanced, user-friendly experience. For example, users can set allowances for operators to send tokens on their behalf.

Increased Transparency: With ERC777, users can see which contracts will interact with their tokens, increasing the transparency of token transactions.

Issues:

Backward Compatibility: ERC777 is not fully backward-compatible with ERC20. Some existing contracts designed for ERC20 may not function correctly with ERC777 tokens, leading to potential issues like lost tokens.

Reentrancy Attacks: The hook mechanism can potentially expose tokens to reentrancy attacks if not implemented carefully. Smart contracts need to be designed with this risk in mind.

ERC1363
Introduction and Problems Solved:

ERC1363 was introduced to enhance the functionality of ERC20 tokens by incorporating features that enable tokens to be used for more complex transactions.

Payable Token: It's a standard for a "Payable Token," which means it can be used to make payments within smart contracts. This allows ERC1363 tokens to be used in transactions where token transfers trigger additional logic in the receiving contract.

Simplified Crowdfunding and Subscription Services: ERC1363 makes it easier to handle subscriptions or crowdfunding campaigns within the Ethereum ecosystem by allowing the tokens themselves to initiate and handle complex transactional logic.

Enhanced Functionality for ERC20: It builds upon the ERC20 standard by adding additional functions that enable token transfers to execute more sophisticated operations, thus increasing the versatility of ERC20 tokens.
