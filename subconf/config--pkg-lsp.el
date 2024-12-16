;;; config--pkg-lsp.el --- Generated package (no.68) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.68) from my config.
;;
;;  During generation, dependency on other aspects of my configuration and
;;  packages is inferred via (regexp-based) static analysis.  While this seems
;;  to do a good job, this method is imperfect.  This code likely depends on
;;  utilities provided by Doom, and if you try to run it in isolation you may
;;  discover the code makes more assumptions.
;;
;;  That said, I've found pretty good results so far.
;;
;;; Code:

(use-package lsp-mode
  :config
  (after! lsp-treemacs
      (map! :leader
        (:prefix "t"
         :desc "lsp treemacs symbols" "s" #'lsp-treemacs-symbols))
  )
  :custom
  (lsp-enable-file-watchers nil)
  (lsp-treemacs-sync-mode)
  (lsp-ui-doc-position "Bottom")
  (lsp-keep-workspace-alive t)
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
