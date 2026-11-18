# Godot

## Questions & Answers

### Q: How to add animations automatically with some split per sec or FPS in Godot? Any tool? Is automatic adding supported with split per measure?

Yes — Godot 4 (including Godot 4.8) supports two built-in workflows so you never need to manually calculate `1 / N` float steps (like `0.0555556` or `0.030303`) or place frames one-by-one:

1. **`AnimatedSprite3D` + `SpriteFrames` (Recommended for 2D frame-by-frame sprites in 3D)**
   - Replace `Sprite3D` + `AnimationPlayer` texture tracks with an `AnimatedSprite3D` node and assign a new `SpriteFrames` resource.
   - In the bottom **SpriteFrames** dock, create animations (`Idle`, `Move`, `Dash`, etc.), set the **Animation Speed (FPS)** spinbox directly as an integer (e.g., `18 FPS`, `24 FPS`, `12 FPS`), and toggle **Loop**.
   - Click **Add Frame from File** (folder icon), multi-select all `.png` frames in the folder (`000`..`017`) at once, or click **Add Frames from Sprite Sheet** (grid icon) to slice a sprite sheet automatically by horizontal/vertical frame count.

2. **`AnimationPlayer` with FPS Snap Mode**
   - If you need `AnimationPlayer` (e.g., to animate additional properties, hitboxes, or method-call tracks alongside sprite frames), look at the bottom-right corner of the **Animation** dock next to the step spinbox: change the snap dropdown from **Seconds** (`s`) to **FPS**.
   - Set the FPS value directly (e.g., `18` or `24`) instead of typing `0.0555556`.
   - Select multiple textures in the **FileSystem** dock and insert keyframes onto the `Sprite3D:texture` track — Godot snaps and advances along exact FPS frame boundaries automatically.
