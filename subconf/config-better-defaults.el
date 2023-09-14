;;; config-better-defaults.el --- Generated package (no.4) from my config -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 TEC
;;
;; Author: TEC <https://git.tecosaur.net/tec>
;; Maintainer: TEC <contact@tecosaur.net>
;; Created: 十月 06, 2023
;; Modified: 十月 06, 2023
;; Version: 2023.10.06
;; Homepage: https://git.tecosaur.net/tec/emacs-config
;; Package-Requires: ((emacs "27.1"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Generated package (no.4) from my config.
;;
;;  This is liable to have unstated dependencies, and reply on other bits of
;;  state from other configuration blocks. Only use this if you know /exactly/
;;  what you are doing.
;;
;;  This may function nicely as a bit of self-contained functionality, or it
;;  might be a horrid mix of functionalities and state.
;;
;;  Hopefully, in future static analysis will allow this to become more
;;  properly package-like.
;;
;;; Code:

(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 ;; x-stretch-cursor t
 )                              ; Stretch cursor to the glyph width

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
      display-time-default-load-average nil)      ; I don't think I've ever found this useful


;; (display-time-mode 1)                             ; Enable time in the mode-line

;; (unless (string-match-p "^Power N/A" (battery))   ; On laptops...
;;   (display-battery-mode 1))                       ; it's nice to know how much power you have

(global-visual-line-mode 1)                       ; Wrap lines at window edge, not at 80th character: my screen is wide enough!

(scroll-bar-mode)                                 ; I like scroll bars

;; Unset C-z which is bound to =suspend-frame= by default
(keymap-global-unset "C-z")

(global-subword-mode 1)                           ; Iterate through CamelCase words
(display-battery-mode 1)
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
;; (setq-default major-mode 'org-mode)

(provide 'config-better-defaults)
;;; config-better-defaults.el ends here
