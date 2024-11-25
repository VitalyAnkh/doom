;;; config--pkg-embark.el --- Generated package (no.19) from my config -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2024 TEC
;;
;; Author: TEC <https://code.tecosaur.net/tec>
;; Maintainer: TEC <contact@tecosaur.net>
;; Created: 十一月 22, 2024
;; Modified: 十一月 22, 2024
;; Version: 2024.11.22
;; Homepage: https://code.tecosaur.net/tec/emacs-config
;; Package-Requires: ((emacs "29.1"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Generated package (no.19) from my config.
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

(use-package embark
  :config
  (keymap-global-set "C-," 'embark-act)
  ;; unbind org-cycle-agenda-files from org-mode-map
  (map! :after org
        :map org-mode-map
        "C-," #'embark-act)
  ;; TODO: this doesn't work
  ;; file one wayland to open a file with external programs
  ;; (map minibuffer-local-map
  ;;       :n "o" #'embark-open-externally
  ;;       )
  )

(provide 'config--pkg-embark)
;;; config--pkg-embark.el ends here
