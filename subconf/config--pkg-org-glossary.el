;;; config--pkg-org-glossary.el --- Generated package (no.94) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.94) from my config.
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
;;   (package! org-glossary :recipe (:host github :repo "tecosaur/org-glossary"))
;;
;;; Code:

(use-package! org-glossary
  :hook (org-mode . org-glossary-mode)
  :config
  (setq org-glossary-collection-root "~/.config/doom/misc/glossaries/")
  (defun +org-glossary--latex-cdef (backend info term-entry form &optional ref-index plural-p capitalized-p extra-parameters)
    (org-glossary--export-template
     (if (plist-get term-entry :uses)
         "*%d*\\emsp{}%v\\ensp{}@@latex:\\labelcpageref{@@%b@@latex:}@@\n"
       "*%d*\\emsp{}%v\n")
     backend info term-entry ref-index
     plural-p capitalized-p extra-parameters))
  (org-glossary-set-export-spec
   'latex t
   :backref "gls-%K-use-%r"
   :backref-seperator ","
   :definition-structure #'+org-glossary--latex-cdef))

(provide 'config--pkg-org-glossary)
;;; config--pkg-org-glossary.el ends here
