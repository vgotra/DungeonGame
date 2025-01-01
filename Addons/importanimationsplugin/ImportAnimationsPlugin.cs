#if TOOLS

[Tool]
public partial class ImportAnimationsPlugin : EditorPlugin
{
    private readonly Button _generateButton = new() { Text = "Create Animation for Sprite3D" };
    private readonly FileDialog _fileDialog = new() { FileMode = FileDialog.FileModeEnum.OpenDir };

    public override void _EnterTree()
    {
        _generateButton.Pressed += OnGenerateButtonPressed;
        AddControlToContainer(CustomControlContainer.Toolbar, _generateButton);
    }

    public override void _ExitTree()
    {
        _fileDialog.DirSelected -= OnFolderSelected;
        _generateButton.Pressed -= OnGenerateButtonPressed;
        RemoveControlFromContainer(CustomControlContainer.Toolbar, _generateButton);
        _fileDialog.QueueFree();
        _generateButton.QueueFree();
    }

    private void OnGenerateButtonPressed()
    {
        _fileDialog.DirSelected += OnFolderSelected;
        _fileDialog.PopupCentered();
    }

    private void OnFolderSelected(string folderPath)
    {
        GD.Print("OnFolderSelected: " + folderPath);
        return;

        if (GetTree().EditedSceneRoot is not Sprite3D sprite3D)
            return;

        var files = Directory.GetFiles(folderPath, "*.png").OrderBy(f => f).ToArray();
        if (files.Length == 0)
            return;

        var animationPlayer = sprite3D.GetNode<AnimationPlayer>("AnimationPlayer");
        if (animationPlayer.GetParent() == null)
            sprite3D.AddChild(animationPlayer);

        var animation = new Animation { LoopMode = Animation.LoopModeEnum.Linear };
        //! Animation tracks, etc
        //animationPlayer.AddAnimation("GeneratedAnimation", animation);
        animation.TrackSetPath(animation.AddTrack(Animation.TrackType.Value), "texture");

        var timeStep = 1.0f / files.Length;
        for (var i = 0; i < files.Length; i++)
        {
            animation.TrackInsertKey(i, i * timeStep, GD.Load<Texture>(files[i]));
        }
    }
}

#endif