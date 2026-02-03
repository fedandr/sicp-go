// sicp 1.03

package main

import (
	"fmt"
	"os"
	"strconv"
)

// procedure for exercise 1.03
func sum_mx_sq(a, b, c int) int {
	s2s := func(x, y int) int {
		return x*x + y*y
	}
	var t int
	switch {
	case (a <= b) && (a <= c):
		t = s2s(b, c)
	case (b <= a) && (b <= c):
		t = s2s(a, c)
	case (c <= a) && (c <= b):
		t = s2s(a, b)
	}
	return t
}

func main() {
	if len(os.Args) != 4 {
		fmt.Println("\n-> USAGE: sicp1_03 int int int")
		os.Exit(1)
	}
	a, _ := strconv.Atoi(os.Args[1])
	b, _ := strconv.Atoi(os.Args[2])
	c, _ := strconv.Atoi(os.Args[3])
	fmt.Println(sum_mx_sq(a, b, c))
}
