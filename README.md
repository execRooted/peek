# hview

**hop view — a smarter `ls` command for your terminal.**

hview remembers which directories you use most frequently, so you can "list" them in just a few keystrokes. It's cross-platform and works on macOS, Linux, and Windows.

Inspired by [z](https://github.com/rupa/z) and [autojump](https://github.com/wting/autojump).

--- 

If you found this project interesting and want to help me out, buy me a coffee :)

[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-%23FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://buymeacoffee.com/execrooted)


---

## Installation

The recommended way to install hview is via the install script:

```sh
curl -sSfL https://raw.githubusercontent.com/execRooted/hview/main/install.sh | sh
```

If that fails and you have Rust installed:

```sh
cargo install hview --locked
```

## Setup

After installing, add hview to your shell configuration:

<details>
<summary>Bash</summary>

Add this to the end of `~/.bashrc`:

```sh
eval "$(hview init bash)"
```

</details>

<details>
<summary>Zsh</summary>

Add this to the end of `~/.zshrc`:

```sh
eval "$(hview init zsh)"
```

</details>

<details>
<summary>Fish</summary>

Add this to the end of `~/.config/fish/config.fish`:

```sh
hview init fish | source
```

</details>

<details>
<summary>PowerShell</summary>

Add this to your PowerShell profile:

```powershell
Invoke-Expression (& { (hview init powershell | Out-String) })
```

</details>

<details>
<summary>Any POSIX shell</summary>

```sh
eval "$(hview init posix --hook prompt)"
```

</details>

## Usage

```sh
h foo              # list the highest ranked directory matching foo
h foo bar          # list the highest ranked directory matching foo and bar
h foo /            # list a subdirectory starting with foo

h ~/foo            # h also works like a regular ls command
h foo/             # list relative path
h ..               # list one level up
h -                # list previous directory

hi foo             # interactive selection (using fzf)

h foo<SPACE><TAB>  # show interactive completions
```

## Configuration

hview can be configured using environment variables:

- `_HVIEW_DATA_DIR` - Directory for the database
- `_HVIEW_ECHO` - Print the matched directory before listing it (`1` to enable)
- `_HVIEW_EXCLUDE_DIRS` - Exclude directories from the database
- `_HVIEW_FZF_OPTS` - Custom options for fzf
- `_HVIEW_MAXAGE` - Maximum age for database entries
- `_HVIEW_RESOLVE_SYMLINKS` - Resolve symlinks before adding to database

## fzf

For interactive selection (`hi` and completions), install [fzf](https://github.com/junegunn/fzf).

## Import

If you're coming from another directory-jumping tool, import your data:

```sh
hview import z        # from z
hview import z.lua    # from z.lua
hview import autojump # from autojump
hview import fasd     # from fasd
```

---

Made by execRooted