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

- [macOS-setup](https://github.com/nesbert/macOS-setup/) handles machine bootstrap, package installation, and update scripts.
- [macOS-dotfiles](https://github.com/nesbert/macOS-dotfiles/) holds the day-to-day configuration files that shape the terminal and development experience.
- The dotfiles repo can later be added to [macOS-setup](https://github.com/nesbert/macOS-setup/) as a Git submodule if I want to keep the two projects linked without mixing responsibilities.

## Planned Structure

As this repo grows, it will likely follow a layout similar to:

```text
.
├── .gitconfig
├── .config/
│   ├── fastfetch/
│   │   └── config.jsonc
│   ├── ghostty/
│   │   └── config
│   ├── git/
│   │   ├── config
│   │   ├── personal
│   │   └── work
│   └── starship/
│       └── starship.toml
├── .ssh/
│   └── config
└── .zshrc
```

## How I Use This

The intended workflow is:

1. Use [macOS-setup](https://github.com/nesbert/macOS-setup/) to prepare a machine with the required tools and packages.
2. Pull this repository to apply terminal, shell, prompt, and related app configuration.
3. Optionally wire this repo into [macOS-setup](https://github.com/nesbert/macOS-setup/) as a submodule so setup and configuration stay versioned independently.

## Included Templates

This repo now includes portable templates for:

- `.ssh/config.local.example`
- `.gitconfig`
- `.config/git/config`
- `.config/git/config.local.example`
- `.config/git/work.local.example`
- `.config/git/school.local.example`
- `.config/git/personal.local.example`

The SSH config example uses explicit host aliases so work, school, and personal GitHub accounts do not fight over the same `github.com` host:

- `github-work`
- `github-school`
- `github-personal`

The top-level `.gitconfig` acts as a small entrypoint that includes `.config/git/config`.

The Git config uses an ignored local routing file plus ignored local identity
files:

- `.config/git/config` is tracked and shared
- `.config/git/config.local` is ignored and machine-specific
- `.config/git/personal.local`, `.config/git/work.local`, and
  `.config/git/school.local` are ignored and hold real identities

Start by copying the example files:

```sh
cp .config/git/config.local.example .config/git/config.local
cp .config/git/personal.local.example .config/git/personal.local
cp .config/git/work.local.example .config/git/work.local
cp .config/git/school.local.example .config/git/school.local
cp .ssh/config.local.example .ssh/config.local
```

Then edit those local files with your real values and paths. That keeps the
shared repo safe while still making the intended structure obvious.

One important detail: the `includeIf "gitdir:..."` rules should point at a directory prefix and end with a trailing slash. For example:

```gitconfig
[includeIf "gitdir:~/Code/github.com/your-work-org/"]
  path = ~/.config/git/work.local

[includeIf "gitdir:~/Code/github.com/your-school-org/"]
  path = ~/.config/git/school.local

[includeIf "gitdir:~/Code/github.com/your-personal-account/"]
  path = ~/.config/git/personal.local
```

That form matches repositories whose `.git` directories live under those folders. Using a narrower pattern can fail to match nested repositories the way you expect.

## Notes

- This repo is meant for public-safe configuration only.
- Machine-specific secrets, tokens, and private overrides should stay out of version control.
- Expect the contents to evolve as I continue refining my macOS development environment.
