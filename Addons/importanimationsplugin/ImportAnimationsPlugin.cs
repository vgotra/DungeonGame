#if TOOLS

[Tool]
public partial class ImportAnimationsPlugin : EditorPlugin
{
    private Button _generateButton;

    public override void _EnablePlugin()
    {
        base._EnablePlugin();
        GD.Print("Loaded plugin: ImportAnimationsPlugin");
        _generateButton = new Button { Text = "Import Animations" };
        _generateButton.Pressed += OnGenerateButtonPressed;
        AddControlToContainer(CustomControlContainer.Toolbar, _generateButton);
    }

    public override void _DisablePlugin()
    {
        base._DisablePlugin();
        GD.Print("Unloaded plugin: ImportAnimationsPlugin");
        RemoveControlFromContainer(CustomControlContainer.Toolbar, _generateButton);
        _generateButton.Pressed -= OnGenerateButtonPressed;
        _generateButton.Free();
        _generateButton = null;
    }

    private void OnGenerateButtonPressed()
    {
        var folderPath = ProjectSettings.GlobalizePath("res://Assets/Sprites/Characters/Player");
        GD.Print("OnFolderSelected: " + folderPath);

        var files = Directory.GetFiles(folderPath, "*.png").OrderBy(f => f).ToArray();
        if (files.Length == 0)
        {
            GD.PrintErr("No files found in the folder");
            return;
        }

        if (GetTree().EditedSceneRoot is not Sprite3D sprite3D)
        {
            GD.PrintErr("Please select a Sprite3D node to import animations");
            return;
        }

        /* Check this later
		var animation = new Animation { LoopMode = Animation.LoopModeEnum.Linear };
		//! Animation tracks, etc
		//animationPlayer.AddAnimation("GeneratedAnimation", animation);
		animation.TrackSetPath(animation.AddTrack(Animation.TrackType.Value), "texture");

		var timeStep = 1.0f / files.Length;
		for (var i = 0; i < files.Length; i++)
		{
			animation.TrackInsertKey(i, i * timeStep, GD.Load<Texture>(files[i]));
		}
		*/
    }
}

#endif
