rec append(xs, ys) =
  if xs = nil then ys
  else head(xs) : append(tail(xs), ys);;

"append(xs, ys) testing";;

print("xs nil, ys nil        "); (
  append(
    list(),
    list()
  ) = list()
);;

print("xs nil, ys full       "); (
  append(
    list(),
    list(1, 2, 3)
  ) = list(1, 2, 3)
);;

print("xs full, ys nil       "); (
  append(
    list(1, 2, 3),
    list()
  ) = list(1, 2, 3)
);;

print("xs full, ys full      "); (
  append(
    list(1, 2, 3),
    list(4, 5, 6)
  ) = list(1, 2, 3, 4, 5, 6)
);;

rec flatten(xss) =
  if xss = nil then nil
  else if integer(xss) then list(xss)
  else append(flatten(head(xss)), flatten(tail(xss)));;

"flatten(xss) testing";;

print("xss integer           "); (
  flatten(6) = list(6)
);;

print("xss nil               "); (
  flatten(list()) = list()
);;

print("xss singleton         "); (
  flatten(list(1)) = list(1)
);;

print("xss flat list         "); (
  flatten(list(1,2,3)) = list(1,2,3)
);;

print("xss 1 level deep      "); (
  flatten(list(list(),list(1),list(2, 3),4,list(5, 6))) = list(1,2,3,4,5,6)
);;

print("xss 2 levels deep     "); (
  flatten(
    list(list(),list(list(),1),list(2,list(3)),4,list(list(5, 6)))
  ) = list(1,2,3,4,5,6)
);;

rec flatsum(xss) =
  if xss = nil then 0
  else if integer(xss) then xss
  else flatsum(head(xss)) + flatsum(tail(xss));;

"flatsum(xss) testing";;

print("xss integer           "); (
  flatsum(6) = 6
);;

print("xss nil               "); (
  flatsum(list()) = 0
);;

print("xss singleton         "); (
  flatsum(list(1)) = 1
);;

print("xss flat list         "); (
  flatsum(list(1,2,3)) = 6
);;

print("xss 1 level deep      "); (
  flatsum(list(list(),list(1),list(2, 3),4,list(5, 6))) = 21
);;

print("xss 2 levels deep     "); (
  flatsum(
    list(list(),list(list(),1),list(2,list(3)),4,list(list(5, 6)))
  ) = 21
);;

val flatsum1(xss) =
  let rec loop(stack, s) =
    if stack = nil then s
    else (
      let val h = head(stack) in
      let val t = tail(stack) in

      if integer(h)
      then loop(t, s + h)
      else loop(append(h, t), s)
    )
  
  in loop(xss, 0);;

"flatsum1(xss) testing";;

print("xss nil               "); (
  flatsum1(list()) = 0
);;

print("xss singleton         "); (
  flatsum1(list(1)) = 1
);;

print("xss flat list         "); (
  flatsum1(list(1,2,3)) = 6
);;

print("xss 1 level deep      "); (
  flatsum1(list(list(),list(1),list(2, 3),4,list(5, 6))) = 21
);;

print("xss 2 levels deep     "); (
  flatsum1(
    list(list(),list(list(),1),list(2,list(3)),4,list(list(5, 6)))
  ) = 21
);;

val flatsum2(xss) =
  let val stack = new() in
  let val s = new() in
  stack := xss; s := 0;

  while !stack <> nil do (
    let val h = head(!stack) in
    let val t = tail(!stack) in
    
    if integer(h)
    then (stack := t; s := !s + h)
    else stack := append(h, t)
  );

  !s;;

"flatsum2(xss) testing";;

print("xss nil               "); (
  flatsum2(list()) = 0
);;

print("xss singleton         "); (
  flatsum2(list(1)) = 1
);;

print("xss flat list         "); (
  flatsum2(list(1,2,3)) = 6
);;

print("xss 1 level deep      "); (
  flatsum2(list(list(),list(1),list(2, 3),4,list(5, 6))) = 21
);;

print("xss 2 levels deep     "); (
  flatsum2(
    list(list(),list(list(),1),list(2,list(3)),4,list(list(5, 6)))
  ) = 21
);;
  