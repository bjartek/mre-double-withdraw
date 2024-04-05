# MRE showing double withdraw events
```
A.ee82856bf20e2aa6.FungibleToken.Withdrawn
  withdrawnUUID -> 158329674399744
           type -> A.0ae53cb6e3f42a79.FlowToken.Vault
         amount -> 4.2
           from -> 0x179b6b1cb6755e31
       fromUUID -> 153931627888642
  A.ee82856bf20e2aa6.FungibleToken.Withdrawn
           from -> 0x179b6b1cb6755e31
       fromUUID -> 158329674399744
  withdrawnUUID -> 158329674399745
           type -> A.0ae53cb6e3f42a79.FlowToken.Vault
         amount -> 4.2

    A.ee82856bf20e2aa6.FungibleToken.Withdrawn
      withdrawnUUID -> 158329674399746
               type -> A.0ae53cb6e3f42a79.FlowToken.Vault
             amount -> 1
           fromUUID -> 158329674399745

      A.ee82856bf20e2aa6.FungibleToken.Deposited
                 type -> A.0ae53cb6e3f42a79.FlowToken.Vault
               amount -> 1
                   to -> 0xf8d6e0586b0a20c7
               toUUID -> 0
        depositedUUID -> 158329674399746

      A.f8d6e0586b0a20c7.TokenForwarding.ForwardedDeposit
        depositedUUID -> 158329674399746
                 from -> 0xe03daebed8ca0615
                   to -> 0xf8d6e0586b0a20c7
               toUUID -> 0
               amount -> 1
       This is a transfer of 1 from 0x179 to 0xf8 if _not_ dapper. if dapper it is to 0xe03

    A.ee82856bf20e2aa6.FungibleToken.Deposited
                 to -> 0xf3fcd2c1a78f5eee
             toUUID -> 87960930222082
      depositedUUID -> 158329674399745
               type -> A.0ae53cb6e3f42a79.FlowToken.Vault
             amount -> 3.2
     So this will be a transfer to 0xf3 from 0x179
```
