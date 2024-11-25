;;; config--pkg-clang-format.el --- Generated package (no.73) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.73) from my config.
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
;;   (package! clang-format+
;;     :recipe (:host github :repo "SavchenkoValeriy/emacs-clang-format-plus"))
;;
;;; Code:


(use-package clang-format+
  :config
  (add-hook 'c-mode-common-hook #'clang-format+-mode)
  (setq clang-format+-context 'modification)
  (setq clang-format+-always-enable t))

(setq +format-on-save-enabled-modes
      '(not emacs-lisp-mode    ; elisp's mechanisms are good enough
            cpp-mode  ; use clang-format+ for C/C++
            c++-mode
            c-mode
            f90-mode
            javascript-mode
            org-msg-edit-mode ; doesn't need a formatter
            sh-mode))

(provide 'config--pkg-clang-format)
;;; config--pkg-clang-format.el ends here
