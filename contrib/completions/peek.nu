module completions {

  # A smarter ls command for your terminal
  export extern peek [
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Add a new directory or increment its rank
  export extern "peek add" [
    --score(-s): string       # The rank to increment the entry if it exists or initialize it with if it doesn't
    --help(-h)                # Print help
    --version(-V)             # Print version
    ...paths: path
  ]

  # Edit the database
  export extern "peek edit" [
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  export extern "peek edit decrement" [
    --help(-h)                # Print help
    --version(-V)             # Print version
    path: string
  ]

  export extern "peek edit delete" [
    --help(-h)                # Print help
    --version(-V)             # Print version
    path: string
  ]

  export extern "peek edit increment" [
    --help(-h)                # Print help
    --version(-V)             # Print version
    path: string
  ]

  export extern "peek edit reload" [
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Import entries from another application
  export extern "peek import" [
    --merge                   # Merge into existing database
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Import from atuin
  export extern "peek import atuin" [
    --merge                   # Merge into existing database
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Import from autojump
  export extern "peek import autojump" [
    --merge                   # Merge into existing database
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Import from fasd
  export extern "peek import fasd" [
    --merge                   # Merge into existing database
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Import from z
  export extern "peek import z" [
    --merge                   # Merge into existing database
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Import from z.lua
  export extern "peek import z.lua" [
    --merge                   # Merge into existing database
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Import from zsh-z
  export extern "peek import zsh-z" [
    --merge                   # Merge into existing database
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  def "nu-complete peek init shell" [] {
    [ "bash" "elvish" "fish" "nushell" "posix" "powershell" "tcsh" "xonsh" "zsh" ]
  }

  def "nu-complete peek init hook" [] {
    [ "none" "prompt" "pwd" ]
  }

  # Generate shell configuration
  export extern "peek init" [
    --no-cmd                  # Prevents peek from defining the `p` and `pi` commands
    --cmd: string             # Changes the prefix of the `p` and `pi` commands
    --hook: string@"nu-complete peek init hook" # Changes how often peek increments a directory's score
    --help(-h)                # Print help
    --version(-V)             # Print version
    shell: string@"nu-complete peek init shell"
  ]

  # Search for a directory in the database
  export extern "peek query" [
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
  export extern "peek remove" [
    --help(-h)                # Print help
    --version(-V)             # Print version
    ...paths: path
  ]

}

export use completions *
