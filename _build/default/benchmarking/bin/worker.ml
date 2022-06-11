open Feather
(* open Feather.Infix *)

let main_worker () =
    (* echo "hello from worker" | tee  *)
    echo "hi" |> Feather.collect stdout;
