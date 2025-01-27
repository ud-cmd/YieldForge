;; Title: YieldForge - Bitcoin Yield Aggregator
;; Summary: A decentralized yield aggregation smart contract for Bitcoin, enabling seamless integration with multiple yield protocols.
;; Description:
;; YieldForge is a cutting-edge smart contract designed to optimize Bitcoin yield generation across various DeFi protocols. 
;; It allows users to deposit Bitcoin, automatically allocates funds to the most efficient yield protocols, and calculates 
;; accrued yields over time. With robust risk management features, including protocol deactivation and allocation limits, 
;; YieldForge ensures secure and efficient yield aggregation. The contract is built with clarity and precision, offering 
;; users a transparent and trustless way to maximize their Bitcoin returns.

;; Errors
(define-constant ERR-UNAUTHORIZED (err u1))
(define-constant ERR-INSUFFICIENT-FUNDS (err u2))
(define-constant ERR-INVALID-PROTOCOL (err u3))
(define-constant ERR-WITHDRAWAL-FAILED (err u4))
(define-constant ERR-DEPOSIT-FAILED (err u5))
(define-constant ERR-PROTOCOL-LIMIT-REACHED (err u6))
(define-constant ERR-INVALID-INPUT (err u7))

;; Storage: Protocols
(define-map supported-protocols 
    {protocol-id: uint} 
    {
        name: (string-ascii 50),
        base-apy: uint,
        max-allocation-percentage: uint,
        active: bool
    }
)

;; Storage: Protocol Counter
(define-data-var total-protocols uint u0)

;; Storage: User Deposits
(define-map user-deposits 
    {user: principal, protocol-id: uint} 
    {
        amount: uint,
        deposit-time: uint
    }
)