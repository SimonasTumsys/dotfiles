# dotfiles

Personal workspace configuration using [GNU Stow](https://github.com/aspiers/stow).

This setup uses symlinks to manage config files in a centralized way.
Each directory in `~/dotfiles` mirrors the structure of your `$HOME` (or `$HOME/.config`) directory.  
By using Stow, symlinks are automatically created in the right places.

**Example:**  
- `zsh/.zshrc` → `$HOME/.zshrc`  
- `nvim/` → `$HOME/.config/nvim`  

> **Important:** Keep the `dotfiles` repo in your `$HOME` directory and don’t change its structure. This ensures Stow places everything correctly.

---

### Dependencies
#### Arch
```bash
pacman -S git
pacman -S stow
```

#### MacOS
```bash
brew install git
brew install stow
```
---

### How to use

1. Clone this repo to your `$HOME` directory
2. Backup existing configs (e.g. `mv ~/.config/ghostty ~/config-backup/ghostty`)
> **Important:** Make sure none of the files/folders that you plan to stow exist in your $HOME or $HOME/.config directories
3. Run `cd ~/dotfiles && stow ghostty`
   → This will create a symlink from `~/dotfiles/ghostty` to `~/.config/ghostty`

---

### Scripts

This configuration uses some scripts. Don't forget to make them executable!

```bash
chmod +x ~/.config/backgrounds/bg_cycle.sh
chmod +x ~/.screenlayout/monitor.sh
chmod +x ~/.config/polybar/launch_polybar.sh
```

---
### Credits

Huge kudos to:
- [Typecraft](https://github.com/typecraft-dev) - for inspiration and useful tutorials on this!
- [JustAdumbPrsn](https://github.com/JustAdumbPrsn) - for lovely background images!

