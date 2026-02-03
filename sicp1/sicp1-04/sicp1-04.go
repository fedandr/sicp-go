/ sicp 1.04

package main

import (
	"fmt"
	"os"
	"strconv"
)

func main() {
	plus := func(a, b int) int { return a + b }
	mnus := func(a, b int) int { return a - b }

	a_plus_abs_b := func(a, b int) int {
		f := plus
		if b < 0 {
			f = mnus
		}
		return f(a, b)
	}

	if len(os.Args) != 3 {
		fmt.Println("\n-> USAGE: sicp1_04 int int")
		os.Exit(1)
	}
	a, _ := strconv.Atoi(os.Args[1])
	b, _ := strconv.Atoi(os.Args[2])
	fmt.Println(a_plus_abs_b(a, b))
}
