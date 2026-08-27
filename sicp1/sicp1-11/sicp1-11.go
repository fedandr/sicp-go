// sicp-1-11

package main

import "fmt"

// recursive process
func f1(n int) int {
	if n < 3 {
		return n
	} else {
		return f1(n-1) + 2*f1(n-2) + 3*f1(n-3)
	}
}

// iterative process
func f3(n int) int {
	a, b, c := 2, 1, 0
	if n < 3 {
		return n
	} else {
		for n >= 3 {
			a, b, c = a+2*b+3*c, a, b
			n--
		}
		return a
	}
}

// would be iterative process, in case of TCO in golang
func f2(n int) int {
	var fi func(a, b, c, k int) int
	fi = func(a, b, c, k int) int {
		switch k {
		case 0:
			return c
		case 1:
			return b
		case 2:
			return a
		default:
			return fi(a+2*b+3*c, a, b, k-1)
		}
	}
	return fi(2, 1, 0, n)
}

func main() {
	for i := range 10 {
		fmt.Println(f1(i), f2(i), f3(i))
	}
}
