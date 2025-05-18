namespace DungeonGame.Scripts.Characters.Players;

public sealed partial class PlayerMoveState : PlayerStateBase
{
	protected override string AnimationName => Constants.Animation.Move;

	[Export] private float _moveSpeed = 5;

	protected override void StatePhysicsProcess(double delta)
	{
		if (CharacterNode.Direction == Vector2.Zero)
		{
			CharacterNode.StateMachine.SwitchState<PlayerIdleState>();
			return;
		}

		//CharacterNode.Velocity = new Vector3(CharacterNode.Direction.X, 0, CharacterNode.Direction.Y) * CharacterNode.MovementSpeed;
		CharacterNode.UpdateVelocity(_moveSpeed);
		CharacterNode.Flip();
		CharacterNode.MoveAndSlide();
	}

	public override void _Input(InputEvent @event)
	{
		if (Input.IsActionJustPressed((Constants.Input.Dash)))
			CharacterNode.StateMachine.SwitchState<PlayerDashState>();
	}
}
