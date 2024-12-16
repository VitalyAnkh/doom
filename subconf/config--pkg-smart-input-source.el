;;; config--pkg-smart-input-source.el --- Generated package (no.62) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.62) from my config.
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
;;   (package! sis :recipe (:host github :repo "laishulu/emacs-smart-input-source"
;;                              :files ("*.el" )))
;;
;;; Code:


(use-package! sis
  ;;:hook
  ;;enable the /follow context/ and /inline region/ mode for specific buffers
  ;;(((text-mode prog-mode) . sis-context-mode)
  ;; ((text-mode prog-mode) . sis-inline-mod
  :after meow
  ;;:defer-incrementally meow
  :config
  (sis-ism-lazyman-config "1" "2" 'fcitx5)
  (add-hook 'meow-insert-exit-hook #'sis-set-english)
  (add-to-list 'sis-context-hooks 'meow-insert-exit-hook)
  ;; (defun describe-key-sis ()
  ;;   (interactive)
  ;;   (sis-set-english)
  ;;   (sis-global-respect-mode 0)
  ;;   (describe-key (help--read-key-sequence))
  ;;   (sis-global-respect-mode t))
  ;; :bind (("C-h k" . describe-key-sis))
  )

(provide 'config--pkg-smart-input-source)
;;; config--pkg-smart-input-source.el ends here
