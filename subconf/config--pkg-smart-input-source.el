;;; config--pkg-smart-input-source.el --- Generated package (no.59) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.59) from my config.
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
;;   (package! sis :recipe (:host github :repo "VitalyAnkh/emacs-smart-input-source"
;;                              :files ("*.el" ) :branch "staging"))
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
