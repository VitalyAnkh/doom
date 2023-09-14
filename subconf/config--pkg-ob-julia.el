;;; config--pkg-ob-julia.el --- Generated package (no.87) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.87) from my config.
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

;; (package! ob-julia :recipe (:host github :repo "tecosaur/ob-julia" :files ("*.el" "julia")))
;; (use-package! ob-julia
;;   :commands org-babel-execute:julia
;;   :config
;;   (setq org-babel-julia-command-arguments
;;         `("--sysimage"
;;           ,(when-let ((img "~/.local/lib/julia.so")
;;                       (exists? (file-exists-p img)))
;;              (expand-file-name img))
;;           "--threads"
;;           ,(number-to-string (- (doom-system-cpus) 2))
;;           "--banner=no")))

(provide 'config--pkg-ob-julia)
;;; config--pkg-ob-julia.el ends here
