# ⚡ Developer-Friendly PowerShell Setup

A step-by-step guide to get a beautiful, productive PowerShell terminal with themes, icons, smart history, and more.

---

## 📸 What You Get

| Feature | Tool |
|---|---|
| 🎨 Styled prompt with git status, time, directory | **Oh My Posh** (kushal theme) |
| 🗂️ File & folder icons in `ls` | **Terminal-Icons** |
| 🔮 Inline command suggestions from history | **PSReadLine** |
| ⬆️ Up/down arrows search matching history | **PSReadLine** |
| 🌈 Syntax highlighting as you type | **PSReadLine** |
| 🚀 Smart `cd` that learns your dirs | **zoxide** |
| 🔀 Git info helpers | **posh-git** |

---

## ✅ Prerequisites

- **PowerShell 7+** — [Download here](https://github.com/PowerShell/PowerShell/releases)
- **Windows Terminal** — [Download from Microsoft Store](https://aka.ms/terminal) *(recommended)*
- **A Nerd Font** — Required for icons and prompt symbols to render correctly

### Installing a Nerd Font

1. Go to [nerdfonts.com/font-downloads](https://www.nerdfonts.com/font-downloads)
2. Download **CaskaydiaCove Nerd Font** (based on Cascadia Code, fits Windows Terminal great)
3. Extract the zip and install the `.ttf` files (right-click → Install for all users)
4. In Windows Terminal: **Settings → Profiles → Defaults → Appearance → Font face** → set to `CaskaydiaCove Nerd Font`

---

## 🛠️ Step 1 — Install Tools

Open PowerShell 7 and run each block:

### Oh My Posh
```powershell
winget install --id JanDeDobbeleer.OhMyPosh -s winget --accept-package-agreements --accept-source-agreements
```

### zoxide (smart cd)
```powershell
winget install --id ajeetdsouza.zoxide -s winget --accept-package-agreements --accept-source-agreements
```

### PowerShell Modules
```powershell
Install-Module -Name Terminal-Icons -Repository PSGallery -Force -Scope CurrentUser
Install-Module -Name posh-git       -Repository PSGallery -Force -Scope CurrentUser
```

> After installing, **close and reopen PowerShell** so the new tools are on your PATH.

---

## 🎨 Step 2 — Download the kushal Theme

```powershell
$themesDir = "$env:USERPROFILE\.config\ohmyposh"
New-Item -ItemType Directory -Path $themesDir -Force
Invoke-WebRequest "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/kushal.omp.json" `
    -OutFile "$themesDir\kushal.omp.json"
```

> You can swap `kushal.omp.json` for any theme from the [Oh My Posh theme gallery](https://ohmyposh.dev/docs/themes).

---

## 📝 Step 3 — Create Your PowerShell Profile

Open your profile file for editing:
```powershell
notepad $PROFILE
```

If the file doesn't exist yet, create it first:
```powershell
New-Item -ItemType File -Path $PROFILE -Force
notepad $PROFILE
```

Paste in the contents of **`Microsoft.PowerShell_profile.ps1`** (included in this folder), then save and close.

---

## 🔄 Step 4 — Reload

```powershell
. $PROFILE
```

Or just open a new terminal window. You should see the kushal prompt immediately.

---

## 🧰 Quick Reference — New Commands & Aliases

| Command | What it does |
|---|---|
| `z <name>` | Jump to a recently visited directory (e.g. `z repos`) |
| `ll` | Alias for `Get-ChildItem` (ls with icons) |
| `g` | Alias for `git` |
| `touch <file>` | Create a new empty file |
| `which <cmd>` | Show the full path of a command |
| `reload` | Reload your PowerShell profile |
| `up` | Go up one directory (`cd ..`) |
| `cdl <path>` | `cd` into a folder and list its contents |

---

## ⌨️ PSReadLine Key Bindings

| Key | Action |
|---|---|
| `↑` / `↓` | Search history matching what you've already typed |
| `Tab` | Open a completion menu |
| Start typing | Suggestions appear inline in grey — press `→` to accept |

---

## 🛠️ Customisation Tips

- **Change theme:** Edit the `kushal.omp.json` path in your profile to any `.omp.json` file
- **Browse all themes:** Run `Get-ChildItem "$env:USERPROFILE\.config\ohmyposh"` or visit [ohmyposh.dev/docs/themes](https://ohmyposh.dev/docs/themes)
- **Edit theme:** The `.omp.json` file is plain JSON — tweak colours, segments, icons freely
- **Add more aliases:** Append `Set-Alias` lines to the bottom of your profile

---

## 🐛 Troubleshooting

| Problem | Fix |
|---|---|
| `CONFIG NOT FOUND` in prompt | The theme `.omp.json` path is wrong — verify with `Test-Path "$env:USERPROFILE\.config\ohmyposh\kushal.omp.json"` |
| Icons show as `?` or boxes | Nerd Font not installed or not set in terminal settings |
| `oh-my-posh` not found | Close & reopen terminal after winget install, or run `$env:Path` to check |
| Module not found | Re-run the `Install-Module` commands and restart terminal |
