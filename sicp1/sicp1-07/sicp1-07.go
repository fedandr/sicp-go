// sicp 1.07
package main

import (
	"fmt"
	"math"
)

const precision = 0.000001

func converged(y, z float64) bool {
	return (math.Abs(z-y) < y*precision)
}

func n2iter(x, y float64) float64 {
	improve := func(y float64) float64 {
		return (y + (x / y)) / 2.0
	}
	z := improve(y)
	if converged(y, z) {
		return z
	} else {
		return n2iter(x, z)
	}
}

func newton2rt(x float64) float64 {
	return n2iter(x, 1.0)
}

func main() {
	fmt.Println(newton2rt(2))
}
