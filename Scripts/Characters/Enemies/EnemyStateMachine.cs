namespace DungeonGame.Scripts.Characters.Enemies;

public sealed partial class EnemyStateMachine : Node
{
	[Export] private Node _currentState;
	[Export] private Node[] _states;

	public override void _Ready()
	{
		ArgumentNullException.ThrowIfNull(_currentState);
		ArgumentNullException.ThrowIfNull(_states);

		if (_states.Length == 0)
			throw new ApplicationException($"{nameof(EnemyStateMachine)} is not properly configured");

		_currentState.Notification(Constants.Notification.EnterState);
	}

	public void SwitchState<T>()
	{
		var newState = _states.FirstOrDefault(state => state is T);
		if (newState == null)
			return;

		_currentState.Notification(Constants.Notification.ExitState);
		_currentState = newState;
		_currentState.Notification(Constants.Notification.EnterState);
	}
}
