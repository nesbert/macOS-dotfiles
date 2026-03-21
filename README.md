# macOS-dotfiles

Personal macOS dotfiles and application configuration files.

This repository is the configuration-focused companion to [macOS-setup](https://github.com/nesbert/macOS-setup/). The goal is to keep shell-based install and update automation in one project, while storing the actual dotfiles and app configs here in a separate, easier-to-share repository.

Examples of the kinds of files this repo is intended to hold:

- `.config/ghostty/config`
- `.config/starship/starship.toml`
- `.config/fastfetch/config.jsonc`
- `.zshrc`

## Why split this out?

Separating these concerns makes both repos simpler:

- `macOS-setup` handles machine bootstrap, package installation, and update scripts.
- `macOS-dotfiles` holds the day-to-day configuration files that shape the terminal and development experience.
- The dotfiles repo can later be added to `macOS-setup` as a Git submodule if I want to keep the two projects linked without mixing responsibilities.

## Planned Structure

As this repo grows, it will likely follow a layout similar to:

```text
.
├── .config/
│   ├── fastfetch/
│   │   └── config.jsonc
│   ├── ghostty/
│   │   └── config
│   └── starship/
│       └── starship.toml
└── .zshrc
```

## How I Use This

The intended workflow is:

1. Use [macOS-setup](https://github.com/nesbert/macOS-setup/) to prepare a machine with the required tools and packages.
2. Pull this repository to apply terminal, shell, prompt, and related app configuration.
3. Optionally wire this repo into `macOS-setup` as a submodule so setup and configuration stay versioned independently.

## Notes

- This repo is meant for public-safe configuration only.
- Machine-specific secrets, tokens, and private overrides should stay out of version control.
- Expect the contents to evolve as I continue refining my macOS development environment.
