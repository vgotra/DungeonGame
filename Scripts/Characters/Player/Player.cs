public partial class Player : CharacterBody3D
{
    private const float Speed = 4;
    private  Vector2 _direction = Vector2.Zero;
    
    public override void _PhysicsProcess(double delta)
    {
        Velocity = new Vector3(_direction.X, 0, _direction.Y) * Speed;
        MoveAndSlide();
    }

    public override void _Input(InputEvent @event)
    {
        //NOTE: Add options to Inverse movement of the player
        _direction = Input.GetVector("MoveLeft", "MoveRight", "MoveBackward", "MoveForward");
    }
}