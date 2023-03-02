"should exit out of the inner loop";;
rec test1() = let rec f() = exit in loop f();;

"should exit out of the outer loop";;
rec test2() = loop (let rec f() = exit in f());;

"should exit the inner loop but not the outer, thus hanging";;
rec test3() = loop (let rec f() = exit in loop f());;