;;; config-better-defaults.el --- Generated package (no.4) from my config -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2024 TEC
;;
;; Author: TEC <https://code.tecosaur.net/tec>
;; Maintainer: TEC <contact@tecosaur.net>
;; Created: 十一月 22, 2024
;; Modified: 十一月 22, 2024
;; Version: 2024.11.22
;; Homepage: https://code.tecosaur.net/tec/emacs-config
;; Package-Requires: ((emacs "29.1"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Generated package (no.4) from my config.
;;
;;  During generation, dependency on other aspects of my configuration and
;;  packages is inferred via (regexp-based) static analysis.  While this seems
;;  to do a good job, this method is imperfect.  This code likely depends on
;;  utilities provided by Doom, and if you try to run it in isolation you may
;;  discover the code makes more assumptions.
;;
;;  That said, I've found pretty good results so far.
;;
;;; Code:

(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 ;; x-stretch-cursor t
 )                              ; Stretch cursor to the glyph width

(setq shell-file-name (executable-find "fish"))

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      ;; TODO: find an equivalent for Emacs?
      ;; evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…"                ; Unicode ellispis are nicer than "...", and also save /precious/ space
      password-cache-expiry nil                   ; I can trust my computers ... can't I?
      ;; scroll-preserve-screen-position 'always     ; Don't have `point' jump around
      scroll-margin 2                             ; It's nice to maintain a little margin
      warning-minimum-level  :error               ; Who cares about warnings?
      word-wrap-by-category t                     ; Different languages live together happily
      mouse-drag-and-drop-region-cross-program t
      mouse-1-click-follows-link nil
      server-raise-frame nil
      display-time-default-load-average nil      ; I don't think I've ever found this useful
      doom-theme 'doom-one-light)


;; (display-time-mode 1)                             ; Enable time in the mode-line

(global-visual-line-mode 1)                       ; Wrap lines at window edge, not at 80th character: my screen is wide enough!

(scroll-bar-mode)                                 ; I like scroll bars

;; Unset C-z which is bound to =suspend-frame= by default
(keymap-global-unset "C-z")

(global-subword-mode 1)                           ; Iterate through CamelCase words

nil

;; (push  '(alpha-background . 95) default-frame-alist)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq-default custom-file (expand-file-name ".custom.el" doom-user-dir))
(when (file-exists-p custom-file)
  (load custom-file))

;; (map! :map evil-window-map
;;       "SPC" #'rotate-layout
;;       ;; Navigation
;;       "<left>"     #'evil-window-left
;;       "<down>"     #'evil-window-down
;;       "<up>"       #'evil-window-up
;;       "<right>"    #'evil-window-right
;;       ;; Swapping windows
;;       "C-<left>"       #'+evil/window-move-left
;;       "C-<down>"       #'+evil/window-move-down
;;       "C-<up>"         #'+evil/window-move-up
;;       "C-<right>"      #'+evil/window-move-right)

(global-set-key [remap dabbrev-expand] #'hippie-expand)

(setq hippie-expand-try-functions-list
      '(try-expand-list
        try-expand-dabbrev-visible
        try-expand-dabbrev
        try-expand-all-abbrevs
        try-expand-dabbrev-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev-from-kill
        try-expand-whole-kill
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; (setq-default major-mode 'org-mode)

(provide 'config-better-defaults)
;;; config-better-defaults.el ends here
