// sicp 1.01
package main

import "fmt"

func main() {
	fmt.Println(10)
	fmt.Println(5 + 3 + 4)
	fmt.Println(9 - 1)
	fmt.Println(6 / 2)
	fmt.Println((2 * 4) + (4 - 6))
    
	a := 3
	b := a + 1
	fmt.Println(a + b + (a * b))
	fmt.Println(a == b)
	if b > a && b < (a*b) {
		fmt.Println(b)
	} else {
		fmt.Println(a)
	}
    
    switch {
	case a == 4:
		fmt.Println(6)
	case b == 4:
		fmt.Println(6 + 7 + a)
	default:
		fmt.Println(25)
	}    
	
    t := a
    if b > a {
		t = b
	}
	fmt.Println(2 + t)

    
	t = -1
	if a > b {
		t = a
	} else if a < b {
		t = b
	}
	fmt.Println(t * (a + 1))
}
