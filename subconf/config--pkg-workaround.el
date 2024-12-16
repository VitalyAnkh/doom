;;; config--pkg-workaround.el --- Generated package (no.3) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.3) from my config.
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
;;   (package! separate-inline :recipe (:host github :repo "ingtshan/separate-inline.el" :files ("*.el")))
;;
;;  Package statement:
;;   (unpin! yasnippet)
;;
;;  Package statement:
;;   (unpin! citar)
;;
;;  Package statement:
;;   (unpin! citar-org-roam)
;;
;;  Package statement:
;;   (unpin! auto-yasnippet)
;;
;;  Package statement:
;;   (unpin! emacsql)
;;
;;  Package statement:
;;   (unpin! magit-gitflow)
;;
;;  Package statement:
;;   (unpin! magit-popup)
;;
;;  Package statement:
;;   (unpin! magit-todos)
;;
;;  Package statement:
;;   (unpin! magit)
;;
;;  Package statement:
;;   (unpin! popwin)
;;
;;  Package statement:
;;   (unpin! ace-window)
;;
;;  Package statement:
;;   (unpin! persp-mode)
;;
;;  Package statement:
;;   (unpin! avy)
;;
;;  Package statement:
;;   (unpin! vertico)
;;
;;  Package statement:
;;   (unpin! closql)
;;
;;  Package statement:
;;   (unpin! centaur-tabs)
;;
;;  Package statement:
;;   (unpin! consult)
;;
;;  Package statement:
;;   (unpin! compat)
;;
;;  Package statement:
;;   (unpin! marginalia)
;;
;;  Package statement:
;;   (unpin! straight)
;;
;;  Package statement:
;;   (unpin! embark)
;;
;;  Package statement:
;;   (unpin! centaur-tabs)
;;
;;  Package statement:
;;   (unpin! elisp-tree-sitter)
;;
;;  Package statement:
;;   (unpin! git-gutter)
;;
;;  Package statement:
;;   (unpin! code-review)
;;
;;  Package statement:
;;   (unpin! ox-hugo)
;;
;;  Package statement:
;;   (unpin! dap-mode)
;;
;;  Package statement:
;;   (package! multiple-cursors :disable t)
;;
;;  Package statement:
;;   (package! benchmark-init :recipe (:host github :repo "dholm/benchmark-init-el"))
;;
;;  Package statement:
;;   (package! org-pretty-tags)
;;
;;  Package statement:
;;   (unpin! yaml)
;;
;;  Package statement:
;;   (unpin! haskell-mode)
;;
;;  Package statement:
;;   (package! magit :recipe (:branch "main"))
;;
;;  Package statement:
;;   (package! ghub :recipe (:branch "main"))
;;
;;  Package statement:
;;   (unpin! lsp-metals)
;;
;;  Package statement:
;;   (unpin! lsp-haskell)
;;
;;  Package statement:
;;   (unpin! lsp-java)
;;
;;  Package statement:
;;   (unpin! lsp-mode)
;;
;;  Package statement:
;;   (unpin! dirvish)
;;
;;  Package statement:
;;   (package! treemacs-nerd-icons :disable t)
;;
;;  Package statement:
;;   (unpin! treemacs)
;;
;;  Package statement:
;;   (unpin! lsp-treemacs)
;;
;;  Package statement:
;;   (unpin! treemacs-nerd-icons)
;;
;;  Package statement:
;;   ;; (package! org-xlatex :recipe
;;   ;;   (:host github :repo "ksqsf/org-xlatex" :files ("*.el" "*.html")))
;;
;;  Package statement:
;;   ;;(package! consult-recoll)
;;
;;; Code:


(setq tab-line-separator (propertize "▶" 'face  '(inherit 'tab-line-tab-inactive  :foreground  "SeaGreen3")))

;; TODO
(setq org-latex-logfiles-extensions (quote ("lof" "lot" "tex~" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl")))

;; I like line numbers
(use-package! global-display-line-numbers-mode
  :hook (prog-mode . global-display-line-numbers-mode)
  :hook (fundamental-mode . global-display-line-numbers-mode)
  :hook (text-mode . global-display-line-numbers-mode)
  )

;; (defadvice copilot--complete-post-command (around intercept activate)
;;   (condition-case err
;;       ad-do-it
;;     ;; Let the debugger run
;;     ((debug error) (signal (car err) (cdr err)))))

(setq straight-repository-branch "develop")

(setq package-native-compile t
      ;; byte+native-compile t
      )
;; TODO to make eglot show function's signature within one line
(setq eldoc-echo-area-use-multiline-p nil)

;; debug vertico--exhibit error
(defun force-debug (func &rest args)
  (condition-case e
      (apply func args)
    ((debug error) (signal (car e) (cdr e)))))

(advice-add #'vertico--exhibit :around #'force-debug)
;; make org latex preview images' baseline the same as the text
;; (defun my-org-latex-preview-advice (beg end &rest _args)
;;   (let* ((ov (car (overlays-in beg end)))
;;          (img (cdr (overlay-get ov 'display)))
;;          (new-img (plist-put img :ascent 90)))
;;     (overlay-put ov 'display (cons 'image new-img))))
;; (advice-add 'org--make-preview-overlay
;;             :after #'my-org-latex-preview-advice)
;; (use-package org-xlatex
;;   :after (org)
;;   :hook (org-mode . org-xlatex-mode))

(provide 'config--pkg-workaround)
;;; config--pkg-workaround.el ends here
