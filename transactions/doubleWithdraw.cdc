import "FungibleToken"

transaction(amount: UFix64, to: Address) {

    let vault: @{FungibleToken.Vault}

    prepare(signer: auth(Storage) &Account) {
        let vaultRef = signer.storage.borrow<auth(FungibleToken.Withdraw) &{FungibleToken.Vault}>(from: /storage/flowTokenVault) ?? panic("Could not borrow reference to the owner's Vault!")

        let vault <- vaultRef.withdraw(amount:amount)

        //this could be saved here or put into another resource that is then saved
        signer.storage.save<@{FungibleToken.Vault}>(<- vault, to: /storage/foo)


        let vaultRefNew = signer.storage.borrow<auth(FungibleToken.Withdraw) &{FungibleToken.Vault}>(from: /storage/foo) ?? panic("Could not borrow reference to the owner's Vault!")

        self.vault <- vaultRefNew.withdraw(amount:amount)

    }
    execute {
        // Get the recipient's public account object
        let recipient = getAccount(to)


        // Get a reference to the recipient's Receiver
        let receiverRef = recipient.capabilities.borrow<&{FungibleToken.Receiver}>(/public/flowTokenReceiver)
        ?? panic("Could not borrow receiver reference to the recipient's Vault")

        receiverRef.deposit(from: <-self.vault)
        // Deposit the withdrawn tokens in the recipient's receiver
    }
}
