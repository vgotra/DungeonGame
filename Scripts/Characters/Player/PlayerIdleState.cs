public sealed partial class PlayerIdleState : PlayerStateBase
{
    protected override string AnimationName => Constants.Animation.Idle;

    protected override void StatePhysicsProcess(double delta)
    {
        CharacterNode.Velocity = Vector3.Zero; // Improve this 
        if (CharacterNode.Direction != Vector2.Zero)
            CharacterNode.StateMachine.SwitchState<PlayerMoveState>();
    }

    public override void _Input(InputEvent @event)
    {
        if (Input.IsActionJustPressed((Constants.Input.Dash)))
            CharacterNode.StateMachine.SwitchState<PlayerDashState>();
    }
}
