;;; config-ox-ascii.el --- Generated package (no.111) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.111) from my config.
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

(require 'ox-ascii)

(setq org-ascii-charset 'utf-8)
(when (executable-find "latex2text")
  (after! ox-ascii
    (defvar org-ascii-convert-latex t
      "Use latex2text to convert LaTeX elements to unicode.")

    (defadvice! org-ascii-latex-environment-unicode-a (latex-environment _contents info)
      "Transcode a LATEX-ENVIRONMENT element from Org to ASCII, converting to unicode.
CONTENTS is nil.  INFO is a plist holding contextual
information."
      :override #'org-ascii-latex-environment
      (when (plist-get info :with-latex)
        (org-ascii--justify-element
         (org-remove-indentation
          (let* ((latex (org-element-property :value latex-environment))
                 (unicode (and (eq (plist-get info :ascii-charset) 'utf-8)
                               org-ascii-convert-latex
                               (doom-call-process "latex2text" "-q" "--code" latex))))
            (if (= (car unicode) 0) ; utf-8 set, and sucessfully ran latex2text
                (cdr unicode) latex)))
         latex-environment info)))

    (defadvice! org-ascii-latex-fragment-unicode-a (latex-fragment _contents info)
      "Transcode a LATEX-FRAGMENT object from Org to ASCII, converting to unicode.
CONTENTS is nil.  INFO is a plist holding contextual
information."
      :override #'org-ascii-latex-fragment
      (when (plist-get info :with-latex)
        (let* ((latex (org-element-property :value latex-fragment))
               (unicode (and (eq (plist-get info :ascii-charset) 'utf-8)
                             org-ascii-convert-latex
                             (doom-call-process "latex2text" "-q" "--code" latex))))
          (if (and unicode (= (car unicode) 0)) ; utf-8 set, and sucessfully ran latex2text
              (cdr unicode) latex))))))

(provide 'config-ox-ascii)
;;; config-ox-ascii.el ends here
