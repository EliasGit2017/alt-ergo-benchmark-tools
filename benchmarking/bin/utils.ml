(* A collection of utilities *)

let rec iterate_through_arr f lst =
  match lst with
  | [] -> ()
  | h :: t -> f h;
    iterate_through_arr f t

let print_chan channel =
  let rec loop () =
    let () = print_endline (input_line channel) in
    loop ()
  in
  try loop ()
  with End_of_file -> close_in channel

(* let e = Unix.execv "/usr/bin/xdg-open" [|"/usr/bin/xdg-open"; "/home/elias/OCP/alt-ergo-benchmarks/results-viewer/web-gui/results.html"|]
  in
  print_endline (e ^ "\n " ^ "ok"); 
*)

let cmds_through_unix () =
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

    let res_stat = Sys.command "xdg-open /home/elias/OCP/alt-ergo-benchmarks/results-viewer/web-gui/results.html > /dev/null" in
    Printf.printf "returning stat : %d\n" res_stat;

    print_endline "\n\ndisplaying environment\n";

    let env = Unix.environment () in
    Array.iter print_endline env;
    (* Array.iter (Printf.printf "%s") env *)

    print_endline ("\n The current os is : " ^ Sys.os_type);
