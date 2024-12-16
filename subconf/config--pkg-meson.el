;;; config--pkg-meson.el --- Generated package (no.78) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.78) from my config.
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
;;   (package! meson-mode)
;;
;;; Code:


(use-package meson-mode
  :config
  (add-hook 'meson-mode-hook 'company-mode))
;; (setq auto-mode-alist
;;       (append
;;        '(
;;          ("\\meson.build\\'" . meson-mode)
;;          )
;;        auto-mode-alist))

(provide 'config--pkg-meson)
;;; config--pkg-meson.el ends here
