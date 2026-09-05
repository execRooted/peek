# peek

**A smarter `ls` command for your terminal.**

peek remembers which directories you use most frequently, so you can "list" them in just a few keystrokes. It's cross-platform and works on macOS, Linux, and Windows.

Inspired by [z](https://github.com/rupa/z) and [autojump](https://github.com/wting/autojump).

**Repository:** [https://github.com/execRooted/peek](https://github.com/execRooted/peek)

## Installation

The recommended way to install peek is via the install script:

```sh
curl -sSfL https://raw.githubusercontent.com/execRooted/peek/main/install.sh | sh
```

Or, if you have Rust installed:

```sh
cargo install peek --locked
```

## Setup

After installing, add peek to your shell configuration:

<details>
<summary>Bash</summary>

Add this to the end of `~/.bashrc`:

```sh
eval "$(peek init bash)"
```

</details>

<details>
<summary>Zsh</summary>

Add this to the end of `~/.zshrc`:

```sh
eval "$(peek init zsh)"
```

</details>

<details>
<summary>Fish</summary>

Add this to the end of `~/.config/fish/config.fish`:

```sh
peek init fish | source
```

</details>

<details>
<summary>PowerShell</summary>

Add this to your PowerShell profile:

```powershell
Invoke-Expression (& { (peek init powershell | Out-String) })
```

</details>

<details>
<summary>Any POSIX shell</summary>

```sh
eval "$(peek init posix --hook prompt)"
```

</details>

## Usage

```sh
p foo              # list the highest ranked directory matching foo
p foo bar          # list the highest ranked directory matching foo and bar
p foo /            # list a subdirectory starting with foo

p ~/foo            # p also works like a regular ls command
p foo/             # list relative path
p ..               # list one level up
p -                # list previous directory

pi foo             # interactive selection (using fzf)

p foo<SPACE><TAB>  # show interactive completions
```

## Configuration

peek can be configured using environment variables:

- `_PEEK_DATA_DIR` - Directory for the database
- `_PEEK_ECHO` - Print the matched directory before listing it (`1` to enable)
- `_PEEK_EXCLUDE_DIRS` - Exclude directories from the database
- `_PEEK_FZF_OPTS` - Custom options for fzf
- `_PEEK_MAXAGE` - Maximum age for database entries
- `_PEEK_RESOLVE_SYMLINKS` - Resolve symlinks before adding to database

## fzf

For interactive selection (`pi` and completions), install [fzf](https://github.com/junegunn/fzf).

## Import

If you're coming from another directory-jumping tool, import your data:

```sh
peek import z        # from z
peek import z.lua    # from z.lua
peek import autojump # from autojump
peek import fasd     # from fasd
```

## License

MIT
