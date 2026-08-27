// sicp1-10

package main

import "fmt"

// Ackermann function
func Ack(x, y int) int {
	if y == 0 {
		return 0
	} else if y == 1 {
		return 2
	} else if x == 0 {
		return 2 * y
	} else {
		return Ack(x-1, Ack(x, y-1))
	}
}

func f(n int) int {
	return Ack(0, n)
}
// 2n

func g(n int) int {
	return Ack(1, n)
}
// 0 for n=0, 2^n for n>0

func h(n int) int {
	return Ack(2, n)
}
// 0 for n=0, 2 for n=1, 2^(2^(2^(2...))) n times  = 2^(h(n-1)) for n>1

func k(n int) int {
	return 5 * n * n
}
// 5*n^2

func main() {
	fmt.Println(Ack(1, 10))
	fmt.Println(Ack(2, 4))
	fmt.Println(Ack(3, 3))
}
