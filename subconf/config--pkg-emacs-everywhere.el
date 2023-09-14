;;; config--pkg-emacs-everywhere.el --- Generated package (no.15) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.15) from my config.
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

;; (package! emacs-everywhere :recipe (:host github :repo "tecosaur/emacs-everywhere"))
;; (unpin! emacs-everywhere)
;; (use-package! emacs-everywhere
;;   :if (daemonp)
;;   :config
;;   (require 'spell-fu)
;;   (setq emacs-everywhere-major-mode-function #'org-mode
;;         emacs-everywhere-frame-name-format "Edit ∷ %s — %s")
;;   (defadvice! emacs-everywhere-raise-frame ()
;;     :after #'emacs-everywhere-set-frame-name
;;     (setq emacs-everywhere-frame-name (format emacs-everywhere-frame-name-format
;;                                 (emacs-everywhere-app-class emacs-everywhere-current-app)
;;                                 (truncate-string-to-width
;;                                  (emacs-everywhere-app-title emacs-everywhere-current-app)
;;                                  45 nil nil "…")))
;;     ;; need to wait till frame refresh happen before really set
;;     (run-with-timer 0.1 nil #'emacs-everywhere-raise-frame-1))
;;   (defun emacs-everywhere-raise-frame-1 ()
;;     (call-process "wmctrl" nil nil nil "-a" emacs-everywhere-frame-name)))

(provide 'config--pkg-emacs-everywhere)
;;; config--pkg-emacs-everywhere.el ends here
