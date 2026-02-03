// sicp 1.05
// Applicative order => infinite loop until stack overflow
package main

import "fmt"

func p() int {
	return p()
}

func test(x, y int) int {
	if x == 0 {
		return 0
	} else {
		return y
	}
}

func main() {
	fmt.Println(test(0, p()))
}
