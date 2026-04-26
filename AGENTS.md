# Repository Notes for Agents

This repository is the user's Doom Emacs configuration, forked/ported from
Teco's literate config. Treat these notes as project-specific guidance for
future work in this tree.

## Source of Truth

- The main editable source is `config.org`. It tangles into `init.el`,
  `config.el`, `packages.el`, `cli.el`, and `subconf/*.el`.
- Prefer editing `config.org`, not generated Elisp. Edit generated files only
  when needed to break a failed bootstrap/sync loop, and mirror the change back
  into `config.org`.
- `~/.config/doom` resolves to this repository on the user's machine.
- Useful local reference paths:
  - Doom Emacs source: `/home/vitalyr/projects/dev/emacs-projects/doomemacs`
  - Teco upstream config: `/home/vitalyr/projects/dev/emacs-projects/emacs-config`

## Sync and Tangle Invariants

- For tasks about Doom sync, the acceptance target is the direct CLI:
  `doom sync` or `doom sync -u`. Do not consider wrapper-only success complete
  unless the user explicitly asks for wrapper behavior.
- This config's `confpkg` mechanism needs a full `org-babel-tangle-file` run.
  Doom's newer literate sync can narrow tangle to `config.el`, which leaves
  `subconf/*.el` empty and causes `search-failed ("^;;; Code:\n+")` in
  `confpkg-create-config`.
- The direct-sync compatibility hook in the generated/source `init.el` block is
  intentional: it runs a full `config.org` tangle from `doom-before-sync-hook`
  and sets `__NOTANGLE=1` so Doom does not repeat the narrower tangle.
- Keep `(require 'compile nil t)` available before sync-time tangling. Some
  packages/modes use `define-compilation-mode` during batch compilation.
- After changing `config.org`, verify with direct `doom sync`; for package or
  recipe changes, verify with direct `doom sync -u` when feasible.

## Known Package Compatibility Points

- Do not casually re-enable `(unpin! consult)`. The current setup keeps Consult
  compatible with Doom's Vertico module by defining old public source names
  such as `consult-source-recent-file` from the newer `consult--source-*`
  internals.
- Keep the local recipe workarounds in `config.org` unless the upstream issue
  has been rechecked:
  - `let-completion` needs the `gggion/let-completion.el` recipe override.
  - `page-break-lines` uses branch `main`.
  - `reformatter` uses branch `main`.
- Straight prompts during `doom sync -u` may involve renamed remotes or dirty
  package checkouts. Preserve local changes; stash or inspect instead of
  discarding.

## Runtime Debugging

- For startup errors, reproduce with `TERM=xterm-256color emacs --debug-init -nw`
  from a PTY. Running `-nw` without a TTY can fail with `standard input is not a
  tty`, which is not an init error.
- Use `emacsclient -e` to inspect the currently running Emacs process when the
  bug only appears in the live daemon/session.
- For errors after an Emacs major-version change, suspect stale bytecode/native
  cache before changing configuration. A known example is:
  `Symbol's value as variable is void: envrc-mode--set-explicitly`.
- The envrc/Dirvish error above was caused by Emacs 31 native/cache state mixed
  with an old Emacs 30 `envrc.elc`. Dirvish only triggered envrc activation; it
  was not the root cause. The fix was `doom sync -b`, then restart Emacs or
  hot-load the rebuilt `envrc.elc` and remove stale hooks if necessary.
- Useful envrc checks:
  - `file ~/.config/emacs/.local/straight/build-31.0.50/envrc/envrc.elc`
  - `strings ~/.config/emacs/.local/straight/build-31.0.50/envrc/envrc.elc | rg 'envrc-mode--(set|suppress)-explicitly'`
  - `emacsclient -e '(list :hook envrc-mode-hook :set (boundp (quote envrc-mode--set-explicitly)))'`

## Upstream Comparison Notes

- The Teco upstream checkout is a reference, not the active DOOMDIR.
- Teco upstream only tracks the literate sources such as `README.org` and
  `config.org`; this fork also has local Nix/runtime support files.
- On the current machine/Doom/Emacs combination, raw Teco upstream bootstrap can
  fail before reaching the Consult phase. Reproduce upstream behavior in a temp
  `DOOMDIR` instead of modifying the upstream checkout.

## Teco Merge Policy

- When merging Teco upstream, preserve upstream feature/content changes by
  default, then reapply local compatibility customizations deliberately.
- Do not resolve conflicts by taking only "ours" or only "theirs" for
  `config.org`. Inspect each hunk and keep both the upstream intent and the local
  runtime constraints where possible.
- Local customizations that must be rechecked after every Teco merge:
  - direct `doom sync` support through the full-tangle `doom-before-sync-hook`;
  - Consult public-source compatibility aliases;
  - local recipe workarounds for packages/branches;
  - Nix devShell tooling;
  - Typst integration and `vr/` helper naming;
  - default local theme preference where it interacts with upstream theme logic.
- If Teco updates `:pin` values for a package that is intentionally unpinned in
  this fork, keep it unpinned. The local default is to follow latest package
  versions unless a pin/workaround is explicitly required.
- After a merge, verify direct `doom sync`, direct `doom sync -u` when package
  recipes or pins changed, and `emacs --debug-init -nw`.

## Verification Habits

- Record real command output and exit codes in `progress.md` and distilled
  causes in `findings.md` when debugging sync/startup/runtime issues.
- Prefer evidence from actual commands over assumptions from prior state:
  direct `doom sync -u`, direct `doom sync`, `emacs --debug-init -nw`, and live
  `emacsclient` probes are the useful proof points for this repo.
- Do not revert or delete existing dirty worktree changes unless the user asks.
