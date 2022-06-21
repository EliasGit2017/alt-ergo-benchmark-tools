open Feather
(* open Feather.Infix *)

let main_worker () =
    (* echo "hello from worker" | tee  *)
    echo "Hello from worker, this will be transformed into the worker script" |> Feather.collect stdout;
