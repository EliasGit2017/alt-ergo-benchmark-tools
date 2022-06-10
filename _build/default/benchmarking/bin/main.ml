
let print_chan channel =
  let rec loop () =
    let () = print_endline (input_line channel) in
    loop ()
  in
  try loop ()
  with End_of_file -> close_in channel

let () =
  let (ocaml_stdout, ocaml_stdin, ocaml_stderr) = 
    Unix.open_process_args_full "ls" [|"/bin/ls"; "-l"|] (Unix.environment ())
  in
  close_out ocaml_stdin;
  print_chan ocaml_stdout;
  print_chan ocaml_stderr;
  print_endline "\n1st Script done !";

  let (ocaml_stdout, ocaml_stdin, ocaml_stderr) = 
    Unix.open_process_args_full "tree" [|"/usr/bin/tree"; "-l"|] (Unix.environment ())
  in
  close_out ocaml_stdin;
  print_chan ocaml_stdout;
  print_chan ocaml_stderr;
  print_endline "\n2nd Script done !";

  let _ = Curses.initscr() in
  if Curses.addstr("Hello World, wassup bro ?") && Curses.refresh();
  then
  begin
    let _ = Curses.getch() in
    Curses.endwin()
  end
  else
    print_endline "bad !!"



(* let () = 
    print_endline "Hello, World!" *)