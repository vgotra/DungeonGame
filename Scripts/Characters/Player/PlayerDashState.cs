public sealed partial class PlayerDashState : PlayerStateBase
{
    protected override string AnimationName => Constants.Animation.Dash;

    [Export] private Timer _dashTimerNode;
    [Export] private float _dashSpeed = 10;

    protected override void StateReady()
    {
        _dashTimerNode.Timeout += HandleDashTimeout;
    }

    private void HandleDashTimeout()
    {
        CharacterNode.StateMachine.SwitchState<PlayerIdleState>();
    }

    protected override void Notification(int what)
    {
        //? Also, what if move forward/backward? 
        if (what == Constants.Notification.EnterState)
        {
            CharacterNode.AnimationPlayerNode.Play(AnimationName);
            CharacterNode.UpdateVelocity(_dashSpeed);
            //! for testing, delete this later
            /*  
            CharacterNode.Velocity = new Vector3(CharacterNode.Direction.X, 0, CharacterNode.Direction.Y);
            if (CharacterNode.Velocity == Vector3.Zero)
                 CharacterNode.Velocity = CharacterNode.Sprite3DNode.FlipH ? Vector3.Left : Vector3.Right;
            CharacterNode.Velocity *= _dashSpeed;
            */
            _dashTimerNode.Start();
        }
    }

    protected override void StatePhysicsProcess(double delta)
    {
        CharacterNode.Flip();
        CharacterNode.MoveAndSlide();
    }
}
