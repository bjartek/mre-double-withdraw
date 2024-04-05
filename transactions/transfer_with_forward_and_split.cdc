import "FungibleToken"

transaction(amount: UFix64, to: Address, royalty:Address) {

    let vault: @{FungibleToken.Vault}

    prepare(signer: auth(Storage) &Account) {
        let vaultRef = signer.storage.borrow<auth(FungibleToken.Withdraw) &{FungibleToken.Vault}>(from: /storage/flowTokenVault) ?? panic("Could not borrow reference to the owner's Vault!")

        let vault <- vaultRef.withdraw(amount:amount)
        signer.storage.save<@{FungibleToken.Vault}>(<- vault, to: /storage/foo)

        let vaultRefNew = signer.storage.borrow<auth(FungibleToken.Withdraw) &{FungibleToken.Vault}>(from: /storage/foo) ?? panic("Could not borrow reference to the owner's Vault!")
        self.vault <- vaultRefNew.withdraw(amount:amount)


    }
    execute {
        //setup forwarder for royalty as an example
        //

        // Get the recipient's public account object
        let recipient = getAccount(to)

        //this is using forwarder on purpose to demonstrate a purpose using flow token
        let royaltyRef = getAccount(royalty).capabilities.borrow<&{FungibleToken.Receiver}>(/public/flowTokenForwarder) ?? panic("Could not borrow receiver reference to the recipient's Vault")
        let newVault <- self.vault.withdraw(amount:1.0)
        royaltyRef.deposit(from: <-newVault)

        let receiverRef = recipient.capabilities.borrow<&{FungibleToken.Receiver}>(/public/flowTokenReceiver) ?? panic("Could not borrow receiver reference to the recipient's Vault")
        receiverRef.deposit(from: <-self.vault)
    }
}
