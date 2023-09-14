;;; config--pkg-embark.el --- Generated package (no.19) from my config -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 TEC
;;
;; Author: TEC <https://git.tecosaur.net/tec>
;; Maintainer: TEC <contact@tecosaur.net>
;; Created: 九月 14, 2023
;; Modified: 九月 14, 2023
;; Version: 2023.09.14
;; Homepage: https://git.tecosaur.net/tec/emacs-config
;; Package-Requires: ((emacs "27.1"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Generated package (no.19) from my config.
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

(use-package embark
  :config
  (keymap-global-set "C-," 'embark-act)
  ;; TODO: this doesn't work
  ;; file one wayland to open a file with external programs
  ;; (map minibuffer-local-map
  ;;       :n "o" #'embark-open-externally
  ;;       )
  )

(provide 'config--pkg-embark)
;;; config--pkg-embark.el ends here
