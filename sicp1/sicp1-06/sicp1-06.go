// sicp 1.06
// Infinite loop results in stack overflow, running out of memory.
// Infinite loop, since function newIf requires all its args
// to be evaluated before function application

package main

import (
	"fmt"
	"math"
)

func square(x float64) float64 {
	return x * x
}

func average(x, y float64) float64 {
	return (x + y) / 2
}

func improve(guess, x float64) float64 {
	return average(guess, x/guess)
}

func goodEnough(guess, x float64) bool {
	return (math.Abs(x-square(guess)) < 0.001)
}

func sqrtIter(guess, x float64) float64 {
	if goodEnough(guess, x) {
		return guess
	} else {
		return sqrtIter(improve(guess, x), x)
	}
}

func sqrt(x float64) float64 {
	return sqrtIter(1.0, x)
}

func newIf(predicate bool, thenClause, elseClause float64) float64 {
	if predicate {
		return thenClause
	} else {
		return elseClause
	}
}

func newSqrtIter(guess, x float64) float64 {
	return newIf(goodEnough(guess, x), guess, newSqrtIter(improve(guess, x), x))
}

func newSqrt(x float64) float64 {
	return newSqrtIter(1.0, x)
}

func main() {
	fmt.Println(sqrt(2))    // OK
	fmt.Println(newSqrt(2)) // Infinite loop
}
