open Worker
open Windows_curses
(* open Utils *)

let () =
  
  ("\t Current working dir : " ^ Sys.getcwd()) |> print_endline;

  main_worker() |> print_endline;
  
  Unix.sleep 1;
  
  basic_screen()

(* let () = 
    print_endline "Hello, World!" *)