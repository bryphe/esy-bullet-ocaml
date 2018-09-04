type world
external bulletCreateDynamicsWorld: unit -> world = "bulletCreateDynamicsWorld"
external bulletDestroyDynamicsWorld: world -> unit = "bulletDestroyDynamicsWorld"

let () =
    let world = bulletCreateDynamicsWorld () in
    print_endline ("hello");
    (bulletDestroyDynamicsWorld world);
