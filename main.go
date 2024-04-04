package main

import "github.com/bjartek/overflow/v2"

func main() {
	o := overflow.Overflow()

	o.Tx("doubleWithdraw",
		overflow.WithSigner("first"),
		overflow.WithArg("to", "second"),
		overflow.WithArg("amount", 4.2),
	)
}
