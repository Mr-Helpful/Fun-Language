(-
Jensen's device for Fun with name parameters
-)

val sum(i, a, b, f) =
  let val s = new() in
  i := a; s := 0;
  while !i < b do (s := !s + f; i := !i + 1);
  !s;;

val go() =
  let val i = new() in
  sum(i, 0, 10, !i * !i);;
