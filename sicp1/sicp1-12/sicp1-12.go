// sicp-1-12

package main

import (
	"fmt"
	"math/big"
)

// binomial coefficients for Pascal's triangle
func cfk(n, k int) int {
	if k < 0 || k > n {
		return 0
	} else if k == 0 || k == n {
		return 1
	} else {
		return cfk(n-1, k-1) + cfk(n-1, k)
	}
}

// version with unbounded integers
func cfK(n, k *big.Int) *big.Int {
	z0, z1 := big.NewInt(0), big.NewInt(1)
	if k.Cmp(z0) < 0 || k.Cmp(n) > 0 {
		return z0
	} else if k.Cmp(z0) == 0 || k.Cmp(n) == 0 {
		return z1
	} else {
		u, v, w := new(big.Int), new(big.Int), new(big.Int)
		u.Sub(n, z1)
		v.Sub(k, z1)
		w.Add(cfK(u, v), cfK(u, k))
		return w
	}
}

func main() {
	fmt.Println(cfk(4, 2))                         // 6
	fmt.Println(cfK(big.NewInt(4), big.NewInt(2))) // 6
}
