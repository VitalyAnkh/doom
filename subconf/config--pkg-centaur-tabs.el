;;; config--pkg-centaur-tabs.el --- Generated package (no.47) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.47) from my config.
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

(after! centaur-tabs
  (centaur-tabs-mode -1)
  (setq centaur-tabs-height 27
        centaur-tabs-set-icons t
        centaur-tabs-set-bar 'nil
        centaur-tabs-gray-out-icons 'buffer)
  (keymap-global-set "C-<"  'centaur-tabs-backward)
  (keymap-global-set "C->" 'centaur-tabs-forward)  
  )

;; (setq x-underline-at-descent-line t)

(provide 'config--pkg-centaur-tabs)
;;; config--pkg-centaur-tabs.el ends here
