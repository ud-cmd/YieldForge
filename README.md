# YieldForge - Bitcoin Yield Aggregator Smart Contract

## Overview

YieldForge is a decentralized smart contract designed to optimize Bitcoin yield generation across multiple DeFi protocols. It allows users to deposit Bitcoin, automatically allocates funds to the most efficient yield protocols, and calculates accrued yields over time. With robust risk management features, including protocol deactivation and allocation limits, YieldForge ensures secure and efficient yield aggregation. Built with clarity and precision, the contract offers users a transparent and trustless way to maximize their Bitcoin returns.

---

## Features

1. **Protocol Management**:

   - Add new yield protocols with customizable parameters such as base APY and maximum allocation percentage.
   - Deactivate protocols to manage risk and ensure system integrity.

2. **User Deposits**:

   - Deposit Bitcoin into supported yield protocols.
   - Track user deposits and calculate accrued yields over time.

3. **Yield Calculation**:

   - Simplified yield calculation based on protocol APY and deposit duration.
   - Real-time yield estimation for user withdrawals.

4. **Withdrawals**:

   - Withdraw deposited Bitcoin along with accrued yields.
   - Ensure sufficient funds and enforce protocol constraints.

5. **Risk Management**:

   - Deactivate protocols to prevent further deposits.
   - Enforce maximum allocation limits to prevent overexposure.

6. **Input Validation**:
   - Comprehensive validation for protocol IDs, deposit amounts, and user inputs.
   - Prevent unauthorized access and ensure data integrity.

---

## Smart Contract Structure

### Data Structures

1. **Supported Protocols**:

   - Stores details of supported yield protocols, including:
     - `protocol-id`: Unique identifier for the protocol.
     - `name`: Name of the protocol (up to 50 characters).
     - `base-apy`: Base annual percentage yield (APY) of the protocol.
     - `max-allocation-percentage`: Maximum percentage of total funds that can be allocated to the protocol.
     - `active`: Boolean indicating whether the protocol is active.

2. **User Deposits**:

   - Tracks user deposits into specific protocols, including:
     - `user`: Principal address of the user.
     - `protocol-id`: ID of the protocol.
     - `amount`: Amount of Bitcoin deposited.
     - `deposit-time`: Block height at the time of deposit.

3. **Protocol Total Deposits**:
   - Tracks the total deposits for each protocol, including:
     - `protocol-id`: ID of the protocol.
     - `total-deposit`: Total amount of Bitcoin deposited into the protocol.

---

### Constants

- `MAX-PROTOCOLS`: Maximum number of supported protocols (5).
- `MAX-ALLOCATION-PERCENTAGE`: Maximum allocation percentage for any protocol (100%).
- `BASE-DENOMINATION`: Base denomination for yield calculations (1,000,000).
- `MAX-PROTOCOL-NAME-LENGTH`: Maximum length of protocol names (50 characters).
- `MAX-BASE-APY`: Maximum base APY for any protocol (10,000 = 100%).
- `MAX-DEPOSIT-AMOUNT`: Maximum deposit amount per transaction (1,000,000,000).

---

### Functions

#### 1. **Add Protocol**

- Adds a new yield protocol to the system.
- **Parameters**:
  - `protocol-id`: Unique identifier for the protocol.
  - `name`: Name of the protocol.
  - `base-apy`: Base APY of the protocol.
  - `max-allocation-percentage`: Maximum allocation percentage for the protocol.
- **Validation**:
  - Only the contract owner can add protocols.
  - Validates protocol ID, name, base APY, and allocation percentage.
  - Ensures the maximum number of protocols is not exceeded.

#### 2. **Deposit**

- Allows users to deposit Bitcoin into a supported protocol.
- **Parameters**:
  - `protocol-id`: ID of the protocol.
  - `amount`: Amount of Bitcoin to deposit.
- **Validation**:
  - Validates protocol ID and deposit amount.
  - Ensures the protocol is active and within allocation limits.

#### 3. **Calculate Yield**

- Calculates the yield accrued for a user's deposit in a specific protocol.
- **Parameters**:
  - `protocol-id`: ID of the protocol.
  - `user`: Principal address of the user.
- **Returns**:
  - Accrued yield based on deposit duration and protocol APY.

#### 4. **Withdraw**

- Allows users to withdraw their deposited Bitcoin along with accrued yields.
- **Parameters**:
  - `protocol-id`: ID of the protocol.
  - `amount`: Amount of Bitcoin to withdraw.
- **Validation**:
  - Validates protocol ID and withdrawal amount.
  - Ensures sufficient funds are available for withdrawal.

#### 5. **Deactivate Protocol**

- Deactivates a protocol to prevent further deposits.
- **Parameters**:
  - `protocol-id`: ID of the protocol.
- **Validation**:
  - Only the contract owner can deactivate protocols.
  - Validates protocol ID.

#### 6. **Initialize Protocols**

- Initializes the contract with default protocols.
- **Default Protocols**:
  - Protocol 1: "Stacks Core Protocol" (Base APY: 5%, Max Allocation: 20%).
  - Protocol 2: "Bitcoin Yield Plus" (Base APY: 7.5%, Max Allocation: 30%).

---

## Error Codes

- `ERR-UNAUTHORIZED`: Unauthorized access attempt.
- `ERR-INSUFFICIENT-FUNDS`: Insufficient funds for withdrawal.
- `ERR-INVALID-PROTOCOL`: Invalid protocol ID or inactive protocol.
- `ERR-WITHDRAWAL-FAILED`: Withdrawal process failed.
- `ERR-DEPOSIT-FAILED`: Deposit process failed.
- `ERR-PROTOCOL-LIMIT-REACHED`: Maximum protocol allocation reached.
- `ERR-INVALID-INPUT`: Invalid input parameters.

---

## Usage

### Adding a Protocol

```clarity
(add-protocol u3 "New Yield Protocol" u800 u25)
```

### Depositing Bitcoin

```clarity
(deposit u1 u1000000)
```

### Calculating Yield

```clarity
(calculate-yield u1 tx-sender)
```

### Withdrawing Funds

```clarity
(withdraw u1 u500000)
```

### Deactivating a Protocol

```clarity
(deactivate-protocol u2)
```

---

## Risk Management

YieldForge includes several risk management features to ensure the security and stability of the system:

- **Protocol Deactivation**: Protocols can be deactivated to prevent further deposits.
- **Allocation Limits**: Each protocol has a maximum allocation percentage to prevent overexposure.
- **Input Validation**: Comprehensive validation ensures data integrity and prevents unauthorized access
