;;; config--pkg-pdftotext.el --- Generated package (no.117) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.117) from my config.
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

;; (package! pdftotext :recipe (:host github :repo "tecosaur/pdftotext"))
;; (use-package! pdftotext
;;   :init
;;   (unless (display-graphic-p)
;;     (add-to-list 'auto-mode-alist '("\\.[pP][dD][fF]\\'" . pdftotext-mode))
;;     (add-to-list 'magic-mode-alist '("%PDF" . pdftotext-mode)))
;;   :config
;;   (unless (display-graphic-p) (after! pdf-tools (pdftotext-install)))
;;   ;; For prettyness
;;   (add-hook 'pdftotext-mode-hook #'spell-fu-mode-disable)
;;   (add-hook 'pdftotext-mode-hook (lambda () (page-break-lines-mode 1)))
;;   ;; I have no idea why this is needed
;;   (map! :map pdftotext-mode-map
;;         "<mouse-4>" (cmd! (scroll-down mouse-wheel-scroll-amount-horizontal))
;;         "<mouse-5>" (cmd! (scroll-up mouse-wheel-scroll-amount-horizontal))))


(provide 'config--pkg-pdftotext)
;;; config--pkg-pdftotext.el ends here
