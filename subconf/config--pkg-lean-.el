;;; config--pkg-lean-.el --- Generated package (no.77) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.77) from my config.
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
;;   (package! lean4-mode :recipe
;;     (:host github
;;      :repo "leanprover/lean4-mode"
;;      :files ("data" "*.el")))
;;
;;; Code:


(add-hook 'lean-mode-hook
          (lambda ()  (setq-default sis-english-source "Lean")))

(use-package lean4-mode
  ;; to defer loading the package until required
  :commands (lean4-mode))

(provide 'config--pkg-lean-)
;;; config--pkg-lean-.el ends here
