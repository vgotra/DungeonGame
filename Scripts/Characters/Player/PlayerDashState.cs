using DungeonGame.Scripts.Common;

namespace DungeonGame.Scripts.Characters.Player;

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

    protected override void ProcessNotification(int what)
    {
        if (what == Constants.Notification.EnterState)
        {
            CharacterNode.AnimationPlayerNode.Play(AnimationName);
            CharacterNode.UpdateVelocity(_dashSpeed);
            _dashTimerNode.Start();
        }
    }

    protected override void StatePhysicsProcess(double delta)
    {
        CharacterNode.Flip();
        CharacterNode.MoveAndSlide();
    }
}