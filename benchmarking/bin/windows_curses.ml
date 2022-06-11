open Worker

(* window managing with curses *)

  (* Curses manipulation *)
let () =
  let _ = Curses.initscr() in
  if Curses.addstr( "Hello World, curses is a good library ? " ^ main_worker() ) && Curses.refresh();
  then
    begin
      let _ = Curses.getch() in
      Curses.endwin()
    end
  else
    print_endline "bad !!";
    