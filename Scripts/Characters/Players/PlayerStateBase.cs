namespace DungeonGame.Scripts.Characters.Players;

public abstract partial class PlayerStateBase : Node
{
	protected Player CharacterNode;

	protected virtual string AnimationName => Constants.Animation.None;

	public override void _Ready()
	{
		CharacterNode = GetOwner<Player>();
		StateReady();
	}

	protected virtual void StateReady()
	{
		SetPhysicsProcess(false); //? Can it be improved?
		SetProcessInput(false);
	}

	public override void _PhysicsProcess(double delta) => StatePhysicsProcess(delta);

	protected virtual void StatePhysicsProcess(double delta) { }

	public override void _Notification(int what)
	{
		base._Notification(what);
		ProcessNotification(what);
	}

	protected virtual void ProcessNotification(int what)
	{
		if (what == Constants.Notification.EnterState)
		{
			CharacterNode.AnimationPlayerNode.Play(AnimationName);
			SetPhysicsProcess(true);
			SetProcessInput(true);
		}
		else if (what == Constants.Notification.ExitState)
		{
			SetPhysicsProcess(false);
			SetProcessInput(false);
		}
	}
}
