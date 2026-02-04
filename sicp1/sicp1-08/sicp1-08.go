// sicp 1.08
package main

import (
	"fmt"
	"math"
)

const precision = 0.000001

func converged(y, z float64) bool {
	return (math.Abs(z-y) < y*precision)
}

func n3iter(x, y float64) float64 {
	improve := func(y float64) float64 {
		return (x/(y*y) + (2 * y)) / 3.0
	}
	z := improve(y)
	if converged(y, z) {
		return z
	} else {
		return n3iter(x, z)
	}
}

func newton3rt(x float64) float64 {
	return n3iter(x, 1.0)
}

func main() {
	fmt.Println(newton3rt(2))
}
