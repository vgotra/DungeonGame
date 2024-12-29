public sealed partial class PlayerMoveState : Node
{
    private Player _characterNode;
    
    public override void _Ready()
    {
        _characterNode = GetOwner<Player>();
        SetPhysicsProcess(false); //? Can it be improved?
    }

    public override void _PhysicsProcess(double delta)
    {
        GD.Print("Move State Physics Process");
        
        if (_characterNode.Direction == Vector2.Zero) 
            _characterNode.StateMachine.SwitchState<PlayerIdleState>();
    }
    
    public override void _Notification(int what)
    {
        base._Notification(what);
        if (what == Constants.Notification.EnterState)
        {
            _characterNode.AnimationPlayerNode.Play(Constants.Animation.Move);
            SetPhysicsProcess(true);
        }
        else if (what == Constants.Notification.ExitState)
        {
            SetPhysicsProcess(false);
        }
    }
}
