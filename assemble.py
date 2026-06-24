from pathlib import Path
import shutil

home_stuff = [
    ".profile",
    ".bash_profile",
    ".bashrc",

    ".musca_start",
    ".ratpoisonrc",
    ".spectrwm.conf",
    
    ".gtkrc-2.0",

    ".Xresources",
    ".xinitrc",
    ".xsession",

    "bin/",
    "Pictures/Wallpapers/"
]

config_stuff = [
    "btop",
    "nvim",
    
    "fontconfig",
    "gtk-3.0",
    "gtk-4.0",
    "Kvantum",
    
    "picom",
    "dunst",
    "rofi",
    "tint2",

    "flameshot",
    "gpicview",
    "herbstluftwm",
    "i3",
    "i3status",
    "openbox",
    "wmii",
    
    "sxhkd",
    "awesome",
    "bspwm",
]

HOME = Path.home()
REPO = Path.cwd()

repo_home = REPO / "home"
repo_config = REPO / "config"

repo_home.mkdir(exist_ok=True)
repo_config.mkdir(exist_ok=True)

def copy_item(src: Path, dst: Path):
    if not src.exists():
        print(f'Skipping "{src}".')
        return
    
    if dst.exists():
        if dst.is_dir(): shutil.rmtree(dst)
        else: dst.unlink()

    if src.is_dir(): shutil.copytree(src, dst)
    else: shutil.copy2(src, dst)

    print(f'Copyed "{src}" -> "{dst}".')

for item in home_stuff  : copy_item(HOME / item, repo_home / Path(item).name)
for item in config_stuff: copy_item(HOME / ".config" / item, repo_config / item)
