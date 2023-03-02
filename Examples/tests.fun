"call-by-name testing";;

val callnone(y) = 3;;
val callmany(y) = y; y; 3;;

print("parameters evaluated afresh "); (
  let val x = new() in
  let val f() = x := !x + 1; 0 in
  x := 0; callmany(f()); !x = 2
);;

print("parameters not evaluated    "); (
  let val x = new() in
  let val f() = x := !x + 1; 0 in
  x := 0; callnone(f()); !x = 0
);;

"jensen's device testing";;

val sum(i, a, b, f) =
  let val s = new() in
  i := a; s := 0;
  while !i < b do (s := !s + f; i := !i + 1);
  !s;;

val go() =
  let val i = new() in
  sum(i, 0, 10, !i * !i);;

print("sum of 10 squares = 285     "); (
  go() = 285
);;

print("sum(10) = sum(9) + 81       "); (
  let val i = new() in
  go() = sum(i, 0, 9, !i * !i) + 81
);;