;;; config--pkg-clang-format.el --- Generated package (no.72) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.72) from my config.
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
            org-msg-edit-mode)) ; doesn't need a formatter

(provide 'config--pkg-clang-format)
;;; config--pkg-clang-format.el ends here
