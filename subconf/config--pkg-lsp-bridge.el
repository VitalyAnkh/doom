;;; config--pkg-lsp-bridge.el --- Generated package (no.68) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.68) from my config.
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
;;   (package! lsp-bridge
;;     :recipe (:host github
;;              :repo "manateelazycat/lsp-bridge"
;;              :files ("*.el" "*.py" "acm" "core" "langserver"
;;                      "multiserver" "resources")))
;;
;;  Package statement:
;;   (package! popon
;;     :recipe (:host nil :repo "https://codeberg.org/akib/emacs-popon.git"))
;;
;;  Package statement:
;;   (package! acm-terminal
;;     :recipe (:host github :repo "twlz0ne/acm-terminal"))
;;
;;; Code:

;; (customize-set-variable 'company-global-modes
;;                         (append company-global-modes '(python-mode)))

;; (use-package lsp-bridge
;;   :hook
;;   (python-mode . lsp-bridge-mode)
;;   :init
;;   (setq acm-enable-citre t))

;; (use-package lsp-bridge
;;   :delight (lsp-bridge-mode "")
;;   :config
;;   (require 'yasnippet)
;;   (yas-global-mode 1)

;;   (require 'lsp-bridge)
;;   (global-lsp-bridge-mode)
;;   (setq lsp-bridge-c-lsp-server "clangd"
;;         acm-enable-yas nil
;;         acm-enable-tabnine nil
;;         lsp-bridge-enable-hover-diagnostic t
;;         acm-enable-codeium t)
;;   ;; (setq lsp-bridge-signature-show-function 'lsp-bridge-signature-posframe)
;;   (map! :mode prog-mode
;;         (:leader
;;          :desc "Rename symbol" "c r" #'lsp-bridge-rename
;;          :desc "Diagnostics list" "c x" #'lsp-bridge-diagnostic-list
;;          :desc "Code actions" "c a" #'lsp-bridge-code-action
;;          :desc "Format document" "c f" #'lsp-bridge-code-format))

;;   (add-to-list '+lookup-definition-functions #'lsp-bridge-find-def)
;;   (add-to-list '+lookup-implementations-functions #'lsp-bridge-find-impl)
;;   (add-to-list '+lookup-references-functions #'lsp-bridge-find-references)
;;   (add-to-list '+lookup-type-definition-functions #'lsp-bridge-find-type-def)
;;   (add-to-list '+lookup-documentation-functions #'lsp-bridge-popup-documentation)

;;   (unless (display-graphic-p)
;;     (with-eval-after-load 'acm
;;       (require 'acm-terminal))))

(provide 'config--pkg-lsp-bridge)
;;; config--pkg-lsp-bridge.el ends here
