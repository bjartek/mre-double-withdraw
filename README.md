# MRE showing double withdraw events
```
go run main.go
🧑 Created account: emulator-first with address: 179b6b1cb6755e31 with flow: 10.00
🧑 Created account: emulator-second with address: f3fcd2c1a78f5eee with flow: 10.00
📜 deploy contracts
👌 Tx:doubleWithdraw fee:0.00001000 gas:17 id:93b3935ab15fffb07ec876c4bc535af1502c0d6045807fba019d96a6827e35eb
=== Events ===
A.0ae53cb6e3f42a79.FlowToken.TokensDeposited
  amount -> 4.2
      to -> 0xf3fcd2c1a78f5eee
A.0ae53cb6e3f42a79.FlowToken.TokensWithdrawn
  amount -> 4.2
    from -> 0x179b6b1cb6755e31
A.0ae53cb6e3f42a79.FlowToken.TokensWithdrawn
  amount -> 4.2
    from -> 0x179b6b1cb6755e31
A.ee82856bf20e2aa6.FungibleToken.Withdrawn
           type -> A.0ae53cb6e3f42a79.FlowToken.Vault
         amount -> 4.2
           from -> 0x179b6b1cb6755e31
       fromUUID -> 162727720910850
  withdrawnUUID -> 51677046505472
A.ee82856bf20e2aa6.FungibleToken.Withdrawn
           type -> A.0ae53cb6e3f42a79.FlowToken.Vault
         amount -> 4.2
           from -> 0x179b6b1cb6755e31
       fromUUID -> 51677046505472
  withdrawnUUID -> 51677046505473
A.ee82856bf20e2aa6.FungibleToken.Deposited
  depositedUUID -> 51677046505473
           type -> A.0ae53cb6e3f42a79.FlowToken.Vault
         amount -> 4.2
             to -> 0xf3fcd2c1a78f5eee
         toUUID -> 223200860438530
```
