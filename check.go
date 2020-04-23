package main

/*
union {float f; int i;} uv;

int f2b(float inp) {
	uv.f = inp;
	return uv.i;
}

float b2f(int inp) {
	uv.i = inp;
	return uv.f;
}
*/
import "C"
import (
	"fmt"
	"os"
	"strconv"
)

func main() {
	if os.Args[1] == "f" {
		fmt.Println("float -> hx")
		fv, _ := strconv.ParseFloat(os.Args[2], 32)
		f2h(float32(fv))
	} else if os.Args[1] == "h" {
		fmt.Println("hx -> float")
		hv, _ := strconv.ParseInt(os.Args[2], 16, 32)
		h2f(int(hv))
	}
}

func h2f(inp int) {
	float := float32(C.b2f(_Ctype_int(inp)))
	fmt.Println(float)
}

func f2h(inp float32) {
	bits := int(C.f2b(_Ctype_float(inp)))

	fmt.Printf("Hex:%08X\n", bits)
	fmt.Printf("Exp:%02X\n", bits >> 23 & 0xFF)
	fmt.Printf("Fra:%X\n", bits & 0x7FFFFF)
}

