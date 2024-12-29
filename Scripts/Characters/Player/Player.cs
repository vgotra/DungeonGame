public sealed partial class Player : CharacterBody3D
{
    [ExportGroup("Required Settings")] 
    [Export] public AnimationPlayer AnimationPlayerNode { get; private set; }
    [Export] private Sprite3D _sprite3DNode;
    [Export] private float _movementSpeed = 4;
    [Export] private bool _isInverseMovement = false;
    [Export] public StateMachine StateMachine { get; private set; }

    public Vector2 Direction = Vector2.Zero;
    
    public override void _PhysicsProcess(double delta)
    {
        UpdateVelocity();
        MoveAndSlide();
    }

    public override void _Input(InputEvent @event)
    {
        Direction = _isInverseMovement
            ? Input.GetVector(Constants.Input.MoveLeft, Constants.Input.MoveRight, Constants.Input.MoveBackward, Constants.Input.MoveForward)
            : Input.GetVector(Constants.Input.MoveLeft, Constants.Input.MoveRight, Constants.Input.MoveForward, Constants.Input.MoveBackward);
    }

    private void UpdateVelocity()
    {
        //? Or better to use _direction
        Velocity = new Vector3(Direction.X, 0, Direction.Y) * _movementSpeed;

        if (Velocity.X == 0) return; // No need to flip if we are not moving horizontally

        _sprite3DNode.FlipH = Velocity.X < 0; // Flip sprite horizontally if we are moving left
    }
}