type world
external bulletCreateDynamicsWorld: unit -> world = "bulletCreateDynamicsWorld"

let () =
    let world = bulletCreateDynamicsWorld () in
    print_endline ("hello")
