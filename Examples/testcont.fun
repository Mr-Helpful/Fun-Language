"should exit without a loop to exit from, giving an error";;
"run last as this one will dump __all__ state in the repl";;
rec test1() = let rec f() = exit in loop f();;

"should exit out of the outer loop";;
rec test2() = loop (let rec f() = exit in f());;

"should exit out of the outer loop";;
rec test3() = loop (let rec f() = exit in loop f());;