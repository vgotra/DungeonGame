class_name Constants #TODO: Refactor later, split into multiple files

const Animations = {
    None = StringName(""),
    Idle = StringName("Idle"),
    Move = StringName("Move"),
    Dash = StringName("Dash")
}

const Inputs = {
    MoveLeft = StringName("MoveLeft"),
    MoveRight = StringName("MoveRight"),
    MoveForward = StringName("MoveForward"),
    MoveBackward = StringName("MoveBackward"),
    Dash = StringName("Dash")
}

enum Notifications { # Be careful with system notification int values
    EnterState = 4001,
    ExitState = 4002
}

enum States {
    Idle,
    Move,
    Dash
}
