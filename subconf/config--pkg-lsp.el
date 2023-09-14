;;; config--pkg-lsp.el --- Generated package (no.66) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.66) from my config.
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
;;   (unpin! lsp-mode)
;;
;;; Code:

(use-package lsp-mode
  :custom
  (map! :leader
        (:prefix "t"
         :desc "lsp treemacs symbols" "s" #'lsp-treemacs-symbols))
  (lsp-enable-file-watchers nil)
  (lsp-treemacs-sync-mode)
  (lsp-ui-doc-position "Bottom")
  (lsp-keep-workspace-alive nil)
  (lsp-ui-doc-enable t)
  (lsp-ui-sideline-enable nil)
  (lsp-enable-symbol-highlighting nil)
  (lsp-ui-sideline-ignore-duplicate t)
  (lsp-headerline-breadcrumb-enable t)
  (lsp-headerline-breadcrumb-segments '(symbols))
  (lsp-headerline-breadcrumb-enable-diagnostics nil)
  ;; use tree-sitter to high-light code instead
  (lsp-semantic-tokens-enable nil)
  (lsp-ui-doc-show-with-mouse t)
  (lsp-ui-doc-show-with-cursor nil)
  )
(use-package lsp
  :defer t
  :custom
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection '("python3" "-m" "ffi_navigator.langserver"))
    :major-modes '(python-mode c++-mode)
    :server-id 'ffi-navigator
    :add-on? t))
  )

(provide 'config--pkg-lsp)
;;; config--pkg-lsp.el ends here
