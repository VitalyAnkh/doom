;;; config--pkg-rotate.el --- Generated package (no.14) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.14) from my config.
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
;;   (package! rotate)
;;
;;; Code:

(use-package rotate
  :defer t
  :init
  (keymap-set window-prefix-map "SPC" 'rotate-layout)
  (keymap-set window-prefix-map "r" 'rotate-window)
  (keymap-set window-prefix-map "m v" 'rotate:main-vertical)
  (keymap-set window-prefix-map "m h" 'rotate:main-horizontal)
  (keymap-set window-prefix-map "e v" 'rotate:even-vertical)
  (keymap-set window-prefix-map "e h" 'rotate:even-horizontal)
  )

(provide 'config--pkg-rotate)
;;; config--pkg-rotate.el ends here
