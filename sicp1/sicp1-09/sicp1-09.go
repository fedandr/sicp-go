// sicp_1-09

package main

import "fmt"

func inc(n int) int {
	return n + 1
}

func dec(n int) int {
	return n - 1
}

// linear recursive process, no tail recursion
func plusR(a, b int) int {
	fmt.Println("--", a, b)
	if a == 0 {
		return b
	} else {
		return inc(plusR(dec(a), b))
	}
}

// linear iterative process, with tail recursion
func plusI(a, b int) int {
	fmt.Println("--", a, b)
	if a == 0 {
		return b
	} else {
		return plusI(dec(a), inc(b))
	}
}

func main() {
	fmt.Println(plusI(3, 2))
	fmt.Println(plusR(3, 2))
}

