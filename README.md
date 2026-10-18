# Setup

Clones all `anvea-nsu` subject repositories and organizes them by semester.

## Requirements

- [GitHub CLI](https://cli.github.com/) (`gh auth login`)
- SSH access to GitHub

## Usage

```sh
make
```

This creates an `anvea-nsu` directory next to this repository:

```
anvea-nsu/
├── Subjects/            # every repo with the `subjects` topic
└── Semesters/
    └── 1..8/Subjects/   # symlinks to repos with the `semester-N` topic
```

Running it again clones only new repositories and adds missing links.
