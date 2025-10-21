# Uninstalling TubeScribe

## Quick Uninstall

### Option 1: Automated Script (Recommended)

Download and run the uninstall script:

```bash
curl -sL https://raw.githubusercontent.com/jonhainstock/tubescribe-releases/main/uninstall.sh | bash
```

Or download and run manually:

```bash
curl -L -O https://raw.githubusercontent.com/jonhainstock/tubescribe-releases/main/uninstall.sh
chmod +x uninstall.sh
./uninstall.sh
```

This will:
- Stop any running TubeScribe instances
- Remove the application from `/Applications`
- Remove all application data
- Clean up binaries and logs

### Option 2: Manual Uninstall

1. **Quit TubeScribe** if it's running
2. **Delete the application:**
   - Open Finder → Applications
   - Drag `TubeScribe.app` to the Trash
   - Or use Terminal: `rm -rf /Applications/TubeScribe.app`

3. **Remove application data:**
   ```bash
   rm -rf ~/Library/Application\ Support/TubeScribe
   ```

---

## What Gets Removed

When you uninstall TubeScribe, the following are deleted:

### Application Files
- **Location:** `/Applications/TubeScribe.app`
- **Size:** ~287 MB
- **Contents:** The app itself

### Application Data
- **Location:** `~/Library/Application Support/TubeScribe`
- **Size:** ~280 MB
- **Contents:**
  - `yt-dlp` - YouTube downloader (~34 MB)
  - `whisper` - AI transcription engine (~2.7 MB)
  - `ffmpeg` - Audio converter (~49 MB)
  - `ffprobe` - Audio analyzer (~49 MB)
  - `ggml-base.bin` - AI model (~141 MB)
  - `license.json` - Your license/trial data
  - `tubescribe.log` - Application logs

### What Is NOT Removed
- **Saved transcripts** - Any `.txt` files you saved are NOT deleted
- **Downloads** - Any files in your Downloads folder remain
- **System settings** - No system-wide changes to revert

---

## Privacy Notice

TubeScribe operates **completely offline** for transcription. When you uninstall:

- ✅ All local data is removed
- ✅ No cloud data to delete (we don't store anything online)
- ✅ No accounts to close (no account system)
- ✅ No telemetry to disable (we don't collect usage data)

The only network activity TubeScribe performs:
- Downloading YouTube videos (via yt-dlp)
- Checking for app updates (version.json from GitHub)

---

## Reinstalling Later

If you want to reinstall TubeScribe later:

1. Download the latest version from [GitHub Releases](https://github.com/jonhainstock/tubescribe-releases/releases/latest)
2. Install as normal
3. Your **trial will reset** to 3 free transcriptions (since license.json was deleted)
4. If you had a license key, you can re-enter it after reinstalling

**Note:** Your license key remains valid even after uninstalling. Keep it safe if you paid for a license!

---

## Backup Before Uninstalling

If you want to keep your license data:

```bash
# Backup your license
cp ~/Library/Application\ Support/TubeScribe/license.json ~/Desktop/tubescribe-license-backup.json

# After reinstalling, restore it:
cp ~/Desktop/tubescribe-license-backup.json ~/Library/Application\ Support/TubeScribe/license.json
```

---

## Troubleshooting Uninstall

### "Application is in use" error

```bash
# Force quit TubeScribe
killall TubeScribe

# Or force quit all instances
pkill -9 tubescribe
```

### "Permission denied" error

```bash
# Use sudo for Applications folder
sudo rm -rf /Applications/TubeScribe.app

# Your user should have access to Application Support
rm -rf ~/Library/Application\ Support/TubeScribe
```

### Verify complete removal

```bash
# Check if app is gone
ls /Applications/TubeScribe.app 2>/dev/null && echo "Still there" || echo "Removed"

# Check if data is gone
ls ~/Library/Application\ Support/TubeScribe 2>/dev/null && echo "Still there" || echo "Removed"

# Check disk space freed
df -h ~
```

---

## Feedback

Before you go, we'd love to know why you're uninstalling:

- **Bug or issue?** [Report it](https://github.com/jonhainstock/tubescribe-releases/issues) so we can fix it
- **Missing feature?** [Request it](https://github.com/jonhainstock/tubescribe-releases/issues/new)
- **Just testing?** Thanks for trying TubeScribe!

We appreciate your feedback and hope you'll consider TubeScribe again in the future!

---

## Alternative: Reset Without Uninstalling

If you just want a fresh start:

### Reset trial counter
```bash
rm ~/Library/Application\ Support/TubeScribe/license.json
# Restart TubeScribe - you'll have 3 new trials
```

### Clear logs
```bash
rm ~/Library/Application\ Support/TubeScribe/tubescribe.log
```

### Re-download binaries
```bash
rm -rf ~/Library/Application\ Support/TubeScribe/*
# Restart TubeScribe - it will re-extract everything
```

---

## Support

If you're having issues with uninstalling:
- [GitHub Issues](https://github.com/jonhainstock/tubescribe-releases/issues)
- Email: jonhainstock@gmail.com

Thank you for using TubeScribe! 🎉
