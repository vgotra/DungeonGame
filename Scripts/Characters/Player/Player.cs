using DungeonGame.Scripts.Common;

namespace DungeonGame.Scripts.Characters.Player;

public sealed partial class Player : CharacterBody3D
{
    [ExportGroup("Required Settings")]
    [Export] private Sprite3D Sprite3DNode { get; set; }
    [Export] public AnimationPlayer AnimationPlayerNode { get; private set; }
    [Export] private bool _isInverseMovement;
    [Export] public PlayerStateMachine StateMachine { get; private set; }

    public Vector2 Direction = Vector2.Zero;

    public override void _Ready()
    {
        ArgumentNullException.ThrowIfNull(AnimationPlayerNode);
        ArgumentNullException.ThrowIfNull(Sprite3DNode);
        ArgumentNullException.ThrowIfNull(StateMachine);
    }

    public override void _Input(InputEvent @event)
    {
        Direction = _isInverseMovement
            ? Input.GetVector(Constants.Input.MoveLeft, Constants.Input.MoveRight, Constants.Input.MoveBackward, Constants.Input.MoveForward)
            : Input.GetVector(Constants.Input.MoveLeft, Constants.Input.MoveRight, Constants.Input.MoveForward, Constants.Input.MoveBackward);
    }

    public void UpdateVelocity(float movementSpeed)
    {
        Velocity = new Vector3(Direction.X, 0, Direction.Y);
        if (Velocity == Vector3.Zero)
            Velocity = Sprite3DNode.FlipH ? Vector3.Left : Vector3.Right;
        Velocity *= movementSpeed;
    }

    public void Flip()
    {
        if (Velocity.X == 0)
            return; // No need to flip if we are not moving horizontally

        Sprite3DNode.FlipH = Velocity.X < 0; // Flip sprite horizontally if we are moving left
    }
}