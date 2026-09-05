module completions {

  # hop view — a smarter ls command for your terminal
  export extern hview [
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Add a new directory or increment its rank
  export extern "hview add" [
    --score(-s): string       # The rank to increment the entry if it exists or initialize it with if it doesn't
    --help(-h)                # Print help
    --version(-V)             # Print version
    ...paths: path
  ]

  # Edit the database
  export extern "hview edit" [
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  export extern "hview edit decrement" [
    --help(-h)                # Print help
    --version(-V)             # Print version
    path: string
  ]

  export extern "hview edit delete" [
    --help(-h)                # Print help
    --version(-V)             # Print version
    path: string
  ]

  export extern "hview edit increment" [
    --help(-h)                # Print help
    --version(-V)             # Print version
    path: string
  ]

  export extern "hview edit reload" [
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Import entries from another application
  export extern "hview import" [
    --merge                   # Merge into existing database
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Import from atuin
  export extern "hview import atuin" [
    --merge                   # Merge into existing database
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Import from autojump
  export extern "hview import autojump" [
    --merge                   # Merge into existing database
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Import from fasd
  export extern "hview import fasd" [
    --merge                   # Merge into existing database
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Import from z
  export extern "hview import z" [
    --merge                   # Merge into existing database
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Import from z.lua
  export extern "hview import z.lua" [
    --merge                   # Merge into existing database
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Import from zsh-z
  export extern "hview import zsh-z" [
    --merge                   # Merge into existing database
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  def "nu-complete hview init shell" [] {
    [ "bash" "elvish" "fish" "nushell" "posix" "powershell" "tcsh" "xonsh" "zsh" ]
  }

  def "nu-complete hview init hook" [] {
    [ "none" "prompt" "pwd" ]
  }

  # Generate shell configuration
  export extern "hview init" [
    --no-cmd                  # Prevents hview from defining the `h` and `hi` commands
    --cmd: string             # Changes the prefix of the `h` and `hi` commands
    --hook: string@"nu-complete hview init hook" # Changes how often hview increments a directory's score
    --help(-h)                # Print help
    --version(-V)             # Print version
    shell: string@"nu-complete hview init shell"
  ]

  # Search for a directory in the database
  export extern "hview query" [
    --all(-a)                 # Show unavailable directories
    --interactive(-i)         # Use interactive selection
    --list(-l)                # List all matching directories
    --score(-s)               # Print score with results
    --exclude: path           # Exclude the current directory
    --base-dir: path          # Only search within this directory
    --help(-h)                # Print help
    --version(-V)             # Print version
    ...keywords: string
  ]

  # Remove a directory from the database
  export extern "hview remove" [
    --help(-h)                # Print help
    --version(-V)             # Print version
    ...paths: path
  ]

}

export use completions *
