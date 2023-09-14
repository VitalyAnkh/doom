;;; config--pkg-meow.el --- Generated package (no.23) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.23) from my config.
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
;;  Package statement:
;;   (package! meow)
;;
;;; Code:

(defun meow/setup-leader ()
  (map! :leader
        "?" #'meow-cheatsheet
        "/" #'meow-keypad-describe-key
        "1" #'meow-digit-argument
        "2" #'meow-digit-argument
        "3" #'meow-digit-argument
        "4" #'meow-digit-argument
        "5" #'meow-digit-argument
        "6" #'meow-digit-argument
        "7" #'meow-digit-argument
        "8" #'meow-digit-argument
        "9" #'meow-digit-argument
        "0" #'meow-digit-argument))

(defun meow/setup-doom-keybindings()
  (map! :map meow-normal-state-keymap
        doom-leader-key doom-leader-map)
  (map! :map meow-motion-state-keymap
        doom-leader-key doom-leader-map)
  (map! :map meow-beacon-state-keymap
        doom-leader-key nil)
  (meow/setup-leader)
  )
(defun set-useful-keybindings()
  (keymap-global-set "M-j" 'kmacro-start-macro-or-insert-counter)
  (keymap-global-set "M-k" 'kmacro-end-or-call-macro)
  ;;for doom emacs buffer management
  (map! :leader
        ;; make doom-leader-buffer-map alive
        (:prefix-map ("b" . "buffer")
         :desc "Toggle narrowing"            "-"   #'doom/toggle-narrow-buffer
         :desc "Previous buffer"             "["   #'previous-buffer
         :desc "Next buffer"                 "]"   #'next-buffer
         (:when (modulep! :ui workspaces)
           :desc "Switch workspace buffer"    "b" #'persp-switch-to-buffer
           :desc "Switch buffer"              "B" #'switch-to-buffer)
         (:unless (modulep! :ui workspaces)
           :desc "Switch buffer"               "b"   #'switch-to-buffer)
         :desc "Clone buffer"                "c"   #'clone-indirect-buffer
         :desc "Clone buffer other window"   "C"   #'clone-indirect-buffer-other-window
         :desc "Kill buffer"                 "d"   #'kill-current-buffer
         :desc "ibuffer"                     "i"   #'ibuffer
         :desc "Kill buffer"                 "k"   #'kill-current-buffer
         :desc "Kill all buffers"            "K"   #'doom/kill-all-buffers
         :desc "Switch to last buffer"       "l"   #'evil-switch-to-windows-last-buffer
         :desc "Set bookmark"                "m"   #'bookmark-set
         :desc "Delete bookmark"             "M"   #'bookmark-delete
         :desc "Next buffer"                 "n"   #'next-buffer
         :desc "New empty buffer"            "N"   #'+default/new-buffer
         :desc "Kill other buffers"          "O"   #'doom/kill-other-buffers
         :desc "Previous buffer"             "p"   #'previous-buffer
         :desc "Revert buffer"               "r"   #'revert-buffer
         :desc "Save buffer"                 "s"   #'basic-save-buffer
         ;;:desc "Save all buffers"            "S"   #'evil-write-all
         :desc "Save buffer as root"         "u"   #'doom/sudo-save-buffer
         :desc "Pop up scratch buffer"       "x"   #'doom/open-scratch-buffer
         :desc "Switch to scratch buffer"    "X"   #'doom/switch-to-scratch-buffer
         :desc "Bury buffer"                 "z"   #'bury-buffer
         :desc "Kill buried buffers"         "Z"   #'doom/kill-buried-buffers)
        )
  )

(defun meow-setup ()
  (set-useful-keybindings)
  (meow/setup-doom-keybindings)
  ;; for doom emacs
  ;;(add-to-list 'meow-keymap-alist (cons 'leader doom-leader-map))
  ;;(meow-normal-define-key (cons "SPC" doom-leader-map))
  ;;(meow-motion-overwrite-define-key (cons "SPC" doom-leader-map))
  (map!
   (:when (modulep! :ui workspaces)
     :n "C-t"   #'+workspace/new
     :n "C-S-t" #'+workspace/display
     :g "M-1"   #'+workspace/switch-to-0
     :g "M-2"   #'+workspace/switch-to-1
     :g "M-3"   #'+workspace/switch-to-2
     :g "M-4"   #'+workspace/switch-to-3
     :g "M-5"   #'+workspace/switch-to-4
     :g "M-6"   #'+workspace/switch-to-5
     :g "M-7"   #'+workspace/switch-to-6
     :g "M-8"   #'+workspace/switch-to-7
     :g "M-9"   #'+workspace/switch-to-8
     :g "M-0"   #'+workspace/switch-to-final
     ))
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev))
  (meow-leader-define-key
   ;; SPC j/k will run the original command in MOTION state.
   '("j" . "H-j")
   '("k" . "H-k")
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet)
   )

  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("/" . meow-visit)
   '("a" . meow-append)
   '("A" . meow-join)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-next-symbol)
   '("E" . meow-mark-symbol)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-mark-word)
   '("M" . meow-mark-symbol)
   '("n" . meow-search)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '("p" . meow-yank)
   '("P" . pop-to-mark-command)
   '("q" . meow-open-below)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-grab)
   '("w" . meow-next-word)
   '("x" . meow-line)
   '("X" . meow-line-expand)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   '("'" . repeat)
   '("\\" . quoted-insert)
   ;;TODO: for C-[ translate to ESC, this doesn't work
   ;;'("ESC" . meow-insert-exit)
   ;;'("<escape>" . meow-insert-exit)
   )

  (setq meow-expand-exclude-mode-list nil)
  (setq meow-expand-hint-remove-delay 1024)
  ;; TODO: replace define-key with keymap-set
  (define-key input-decode-map (kbd "C-[") [control-bracketleft])
  (define-key meow-insert-state-keymap [control-bracketleft] 'meow-insert-exit)
  ;; (meow-define-keys 'insert
  ;;   '("ESC" . meow-insert-exit))

  ;; (keymap-set input-decode-map "C-[" 'meow-insert-exit)
  ;; (keymap-set meow-insert-state-keymap "C-[" 'meow-insert-exit)

  (setq meow-use-clipboard t
        meow-visit-sanitize-completion nil
        meow-expand-exclude-mode-list nil
        meow-expand-hint-remove-delay 1024
        )
  (add-to-list 'meow-mode-state-list '(hexl-mode . normal))
  )
(use-package meow
  :config
  (require 'meow)
  (meow-setup)
  (meow-global-mode 1)
  )

(provide 'config--pkg-meow)
;;; config--pkg-meow.el ends here
