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

### How to use

1. Install [GNU Stow](https://github.com/aspiers/stow)  
2. Backup any existing config files you’ll be replacing  
3. Clone this repo to your `$HOME` directory  
4. Delete existing configs (e.g. `rm -rf ~/.config/ghostty`)  
5. Run `cd ~/dotfiles && stow ghostty`  
   → This will create a symlink from `~/dotfiles/ghostty` to `~/.config/ghostty`

---

This makes it easy to create a single configuration and keep it for a long
time, not worrying about losing it in case of switching OS'es or distros.
