public sealed partial class Player : CharacterBody3D
{
    [ExportGroup("Required Settings")] 
    [Export] private AnimationPlayer _animationPlayerNode;
    [Export] private Sprite3D _sprite3DNode;
    [Export] private float _movementSpeed = 4;
    [Export] private bool _isInverseMovement = false;

    private Vector2 _direction = Vector2.Zero;

    public override void _Ready()
    {
        UpdateAnimation();
    }

    public override void _PhysicsProcess(double delta)
    {
        UpdateVelocity();
        MoveAndSlide();
    }

    public override void _Input(InputEvent @event)
    {
        _direction = _isInverseMovement
            ? Input.GetVector(Constants.Input.MoveLeft, Constants.Input.MoveRight, Constants.Input.MoveBackward, Constants.Input.MoveForward)
            : Input.GetVector(Constants.Input.MoveLeft, Constants.Input.MoveRight, Constants.Input.MoveForward, Constants.Input.MoveBackward);

        UpdateAnimation();
    }

    private void UpdateVelocity()
    {
        //? Or better to use _direction
        Velocity = new Vector3(_direction.X, 0, _direction.Y) * _movementSpeed;

        if (Velocity.X == 0) return; // No need to flip if we are not moving horizontally

        _sprite3DNode.FlipH = Velocity.X < 0; // Flip sprite horizontally if we are moving left
    }

    private void UpdateAnimation()
    {
        //! Don't forget about animation looping (especially for Idle) in Animation editor
        _animationPlayerNode.Play(_direction == Vector2.Zero ? Constants.Animation.Idle : Constants.Animation.Move);
    }
}