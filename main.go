package main

import (
	"fmt"

	"github.com/bjartek/overflow/v2"
)

func main() {
	o := overflow.Overflow(overflow.WithEmptyDepositWithdrawEvents(), overflow.WithFlowForNewUsers(100.0))

	o.Tx("setup_forwarder",
		overflow.WithSigner("third"),
		overflow.WithArg("receiver", "account"))

	fmt.Println("We set up an forwarder for flow from third back to sa")

	o.Tx("transfer_with_forward_and_split",
		overflow.WithSigner("first"),
		overflow.WithArg("to", "second"),
		overflow.WithArg("royalty", "third"),
		overflow.WithArg("amount", 4.2),
	)
}
