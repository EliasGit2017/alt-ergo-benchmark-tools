open Worker

(* window managing with curses *)

  (* Curses manipulation *)
let basic_screen () =
  let _ = Curses.initscr() in
  let size_y, size_x = Curses.get_size() in
  if Curses.addstr( "Hello World, curses is a good library ? " ^ main_worker() ) && Curses.refresh();
  then
    begin
      let inin = "" in
      let input_cc = Curses.getstr(inin) in
      Curses.endwin();
      (* List.iter (Printf.printf "%d") size_; *)
      print_endline ("size_x = " ^ string_of_int @@ size_x);
      print_endline ("size_y = " ^ string_of_int @@ size_y);
      print_endline ("key pressed ? : " ^ string_of_bool @@ input_cc);
      print_endline ("string input : " ^ inin)
    end
  else
    print_endline "bad !!";

