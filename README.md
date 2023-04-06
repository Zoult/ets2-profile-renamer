## [⬇ Download](https://raw.githack.com/Zoult/ets2-profile-renamer/main/ETS2%20Profile%20Renamer.bat)

### ⚠️ Disclaimer
For any security check, this tool is free and open source so it can be revised and edited to assure that this tool is completely harmless.

### Usage
<h2>It doesn't work in online convoys, ETS2 uses Steam's account name</h2>

It's very trivial, just open it and follow what it asks.
The Hex code is the code between the `=` . Example
```
- Profiles saved:
- Zoult = 5A6F756C74
```
The Hex code to paste is 5A6F756C74

### 👥 Credits
[yt-dlp](https://github.com/yt-dlp/yt-dlp), the main tool used for downloading MP3s
[FFmpeg](https://github.com/FFmpeg/FFmpeg), the tool used for converting to MP3s

### ❓ What it does
1. Sets the `uset g_save_format` value to 2 in Documents\Euro Truck Simulator 2\config.cfg
2. Decrypts the profile.sii file and sets the `profile_name: ` value to user's input name in Documents\Euro Truck Simulator 2\profiles\\\<selected profile>
3. Renames the selected profile folder to Hex
### Credits
[TheLazyTomcat\'s SII_Decrypt](https://github.com/TheLazyTomcat/SII_Decrypt), the tool used for decrypting profile.sii

---

With 🎨 and ❤ from Zoult
