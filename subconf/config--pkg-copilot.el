;;; config--pkg-copilot.el --- Generated package (no.24) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.24) from my config.
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
;;   (package! copilot :recipe (:host github :repo "zerolfx/copilot.el" :files ("dist" "copilot.el" "copilot-balancer.el")))
;;
;;; Code:


;; (customize-set-variable 'copilot-enable-predicates '((lambda () (eq (meow--current-state) 'insert))))
;; (defun my-tab ()
;;   (interactive)
;;   (or (copilot-accept-completion)
;;       (company-indent-or-complete-common nil)))
;; complete by copilot first, then company-mode

;; disabled for now
;; (use-package! copilot
;;   :after company
;;   :hook (prog-mode . copilot-mode)
;;   :hook (text-mode . copilot-mode)
;;   :bind (("C-TAB" . 'copilot-accept-completion-by-word)
;;          ("C-<tab>" . 'copilot-accept-completion-by-word)
;;          :map company-active-map
;;          ("<tab>" . 'my-tab)
;;          ("TAB" . 'my-tab)
;;          :map company-mode-map
;;          ("<tab>" . 'my-tab)
;;          ("TAB" . 'my-tab)))


(provide 'config--pkg-copilot)
;;; config--pkg-copilot.el ends here
