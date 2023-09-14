;;; config-gimp-palette.el --- Generated package (no.125) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.125) from my config.
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

(define-derived-mode gimp-palette-mode fundamental-mode "GIMP Palette"
  "A major mode for GIMP Palette (.gpl) files that keeps RGB and Hex colors in sync."
  (when (require 'rainbow-mode)
    (rainbow-mode 1))
  (when (bound-and-true-p hl-line-mode)
    (hl-line-mode -1))
  (add-hook 'after-change-functions #'gimp-palette-update-region nil t))
(defun gimp-palette-update-region (beg end &optional _)
  "Update each line between BEG and END with `gimp-palette-update-line'.
If run interactively without a region set, the whole buffer is affected."
  (interactive
   (if (region-active-p)
       (list (region-beginning) (region-end))
     (list (point-min) (point-max))))
  (let ((marker (prepare-change-group)))
    (unwind-protect
        (save-excursion
          (goto-char beg)
          (while (< (point) end)
            (gimp-palette-update-line)
            (forward-line 1)))
      (undo-amalgamate-change-group marker))))
(defun gimp-palette-update-line ()
  "Update the RGB and Hex colour codes on the current line.
Whichever `point' is currently on is taken as the source of truth."
  (interactive)
  (let ((column (current-column))
        (ipoint (point)))
    (beginning-of-line)
    (when (and (re-search-forward "\\=\\([0-9 ]*\\)\\(#[0-9A-Fa-f]\\{6\\}\\)" nil t)
               (<= column (length (match-string 0))))
      (cond
       ((>= column (length (match-string 1))) ; Point in #HEX
        (cl-destructuring-bind (r g b) (color-name-to-rgb (match-string 2))
          (replace-match
           (format "%3d %3d %3d "
                   (round (* 255 r))
                   (round (* 255 g))
                   (round (* 255 b)))
           nil t nil 1)))
       ((string-match-p "\\`[0-9]+ +[0-9]+ +[0-9]+\\'" (match-string 1)) ; Valid R G B
        (cl-destructuring-bind (r g b)
            (mapcar #'string-to-number
                    (save-match-data
                      (split-string (match-string 1) " +" t)))
          (replace-match
           (format "%3d %3d %3d " r g b)
           nil t nil 1)
          (replace-match
           (color-rgb-to-hex (/ r 255.0) (/ g 255.0) (/ b 255.0) 2)
           nil t nil 2)))))
    (goto-char ipoint)))
(add-to-list 'magic-mode-alist (cons "\\`GIMP Palette\n" #'gimp-palette-mode))

(provide 'config-gimp-palette)
;;; config-gimp-palette.el ends here
