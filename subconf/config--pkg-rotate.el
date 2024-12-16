;;; config--pkg-rotate.el --- Generated package (no.14) from my config -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2024 TEC
;;
;; Author: TEC <https://code.tecosaur.net/tec>
;; Maintainer: TEC <contact@tecosaur.net>
;; Created: 十二月 16, 2024
;; Modified: 十二月 16, 2024
;; Version: 2024.12.16
;; Homepage: https://code.tecosaur.net/tec/emacs-config
;; Package-Requires: ((emacs "29.1"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Generated package (no.14) from my config.
;;
;;  During generation, dependency on other aspects of my configuration and
;;  packages is inferred via (regexp-based) static analysis.  While this seems
;;  to do a good job, this method is imperfect.  This code likely depends on
;;  utilities provided by Doom, and if you try to run it in isolation you may
;;  discover the code makes more assumptions.
;;
;;  That said, I've found pretty good results so far.
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
