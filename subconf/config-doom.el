;;; config-doom.el --- Generated package (no.5) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.5) from my config.
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

(setq doom-font (font-spec :family "JetBrains Mono" :size 14)
      doom-big-font (font-spec :family "JetBrains Mono" :size 28)
      ;;doom-variable-pitch-font (font-spec :family "American Typewriter" :size 21)
      doom-variable-pitch-font (font-spec :family "CMU Typewriter Text" :size 17)
      doom-serif-font (font-spec :family "CMU Typewriter Text" :size 17))

(add-hook 'after-init-hook (lambda ()
                             ;; Emoji: 😄, 🤦, 🏴󠁧󠁢󠁳󠁣󠁴󠁿
                             (set-fontset-font "fontset-default" 'symbol "Apple Color Emoji" nil 'prepend)
                             (set-fontset-font "fontset-default" 'symbol "Symbola" nil 'append)
                             (set-fontset-font "fontset-default" 'symbol "Noto Color Emoji" nil 'prepend)
                             (set-fontset-font "fontset-default" 'symbol "Liberation Mono" nil 'prepend)
                             (set-fontset-font "fontset-default" 'symbol "Noto Sans Symbols2" nil 'prepend)
                             (set-fontset-font "fontset-default" 'symbol "Segoe UI Emoji" nil 'append)
                             (set-fontset-font "fontset-default" 'symbol "Free Serif" nil 'prepend)
                             (set-fontset-font "fontset-default" 'symbol "twemoji" nil 'prepend)
                             ;;(set-face-attribute 'default nil :font "Droid Sans Mono")
                             ;; East Asia: 你好, 早晨, こんにちは, 안녕하세요
                             (set-fontset-font "fontset-default" 'han "LXGW WenKai" nil 'prepend)
                             (set-fontset-font "fontset-default" 'kana "LXGW WenKai" nil 'prepend)
                             (set-fontset-font "fontset-default" 'hangul "LXGW WenKai" nil 'prepend)
                             (set-fontset-font "fontset-default" 'cjk-misc "Noto Serif CJK SC Regular" nil 'prepend)
                             ;; Cyrillic: Привет, Здравствуйте, Здраво, Здравейте
                             (set-fontset-font "fontset-default" 'cyrillic "Noto Serif" nil 'prepend)
                             ))
;; (defvar required-fonts '("JetBrainsMono.*" "Overpass" "JuliaMono" "IBM Plex Mono" "Merriweather" "Alegreya"))

;; (defvar available-fonts
;;   (delete-dups (or (font-family-list)
;;                    (split-string (shell-command-to-string "fc-list : family")
;;                                  "[,\n]"))))

;; (defvar missing-fonts
;;   (delq nil (mapcar
;;              (lambda (font)
;;                (unless (delq nil (mapcar (lambda (f)
;;                                            (string-match-p (format "^%s$" font) f))
;;                                          available-fonts))
;;                  font))
;;              required-fonts)))

;; (if missing-fonts
;;     (pp-to-string
;;      `(unless noninteractive
;;         (add-hook! 'doom-init-ui-hook
;;           (run-at-time nil nil
;;                        (lambda ()
;;                          (message "%s missing the following fonts: %s"
;;                                   (propertize "Warning!" 'face '(bold warning))
;;                                   (mapconcat (lambda (font)
;;                                                (propertize font 'face 'font-lock-variable-name-face))
;;                                              ',missing-fonts
;;                                              ", "))
;;                          (sleep-for 0.5))))))
;;   ";; No missing fonts detected")
nil
(setq
 doom-themes-enable-bold nil ; if nil, bold is universally disabled
 doom-themes-enable-italic t ; if nil, italics is universally disabled
 doom-themes-padded-modeline t
 doom-themes-treemacs-enable-variable-pitch nil)

(setq doom-theme 'doom-one-light)
(delq! t custom-theme-load-path)
(remove-hook 'window-setup-hook #'doom-init-theme-h)
(add-hook 'after-init-hook #'doom-init-theme-h 'append)
;; (setq display-line-numbers-type 'relative)
;; (evil-define-command +evil-buffer-org-new (count file)
;;   "Creates a new ORG buffer replacing the current window, optionally
;;    editing a certain FILE"
;;   :repeat nil
;;   (interactive "P<f>")
;;   (if file
;;       (evil-edit file)
;;     (let ((buffer (generate-new-buffer "*new org*")))
;;       (set-window-buffer nil buffer)
;;       (with-current-buffer buffer
;;         (org-mode)
;;         (setq-local doom-real-buffer-p t)))))

;; (map! :leader
;;       (:prefix "b"
;;        :desc "New empty Org buffer" "o" #'+evil-buffer-org-new))

(provide 'config-doom)
;;; config-doom.el ends here
