;;; config-ox-beamer.el --- Generated package (no.109) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.109) from my config.
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

(require 'ox-beamer)

(setq org-beamer-theme "[progressbar=foot]metropolis")
(defun org-beamer-p (info)
  (eq 'beamer (and (plist-get info :back-end)
                   (org-export-backend-name (plist-get info :back-end)))))

(org-export-update-features 'beamer
  (beamer-setup
   :condition t
   :requires .missing-koma
   :prevents (italic-quotes condensed-lists cover-page)))

(org-export-update-features 'latex
  (.missing-koma
   :snippet "\\usepackage{scrextend}"
   :order 2))

(defvar org-beamer-metropolis-tweaks
  "\\NewCommandCopy{\\moldusetheme}{\\usetheme}
\\renewcommand*{\\usetheme}[2][]{\\moldusetheme[#1]{#2}
  \\setbeamertemplate{items}{$\\bullet$}
  \\setbeamerfont{block title}{size=\\normalsize, series=\\bfseries\\parbox{0pt}{\\rule{0pt}{4ex}}}}

\\makeatletter
\\newcommand{\\setmetropolislinewidth}{
  \\setlength{\\metropolis@progressinheadfoot@linewidth}{1.2px}}
\\makeatother

\\usepackage{etoolbox}
\\AtEndPreamble{\\setmetropolislinewidth}"
  "LaTeX preamble snippet that tweaks the Beamer metropolis theme styling.")

(org-export-update-features 'beamer
  (beamer-metropolis
   :condition (string-match-p "metropolis$" (plist-get info :beamer-theme))
   :snippet org-beamer-metropolis-tweaks
   :order 3))
(setq org-beamer-frame-level 2)

(provide 'config-ox-beamer)
;;; config-ox-beamer.el ends here
