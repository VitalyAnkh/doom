;;; config--pkg-doom-modeline.el --- Generated package (no.41) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.41) from my config.
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

(require 'doom-modeline)

(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "orange"))
;; (setq doom-modeline-height 25)
(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (and (memq (plist-get (coding-system-plist buffer-file-coding-system) :category)
                                 '(coding-category-undecided coding-category-utf-8))
                           (not (memq (coding-system-eol-type buffer-file-coding-system) '(1 2))))
                t)))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)
(defvar micro-clock-hour-hand-ratio 0.45
  "Length of the hour hand as a proportion of the radius.")
(defvar micro-clock-minute-hand-ratio 0.7
  "Length of the minute hand as a proportion of the radius.")

(defun micro-clock-svg (hour minute radius color)
  "Construct an SVG clock showing the time HOUR:MINUTE.
The clock will be of the specified RADIUS and COLOR."
  (let ((hour-x (* radius (sin (* (- 6 hour (/ minute 60.0)) (/ float-pi 6)))
                   micro-clock-hour-hand-ratio))
        (hour-y (* radius (cos (* (- 6 hour (/ minute 60.0)) (/ float-pi 6)))
                   micro-clock-hour-hand-ratio))
        (minute-x (* radius (sin (* (- 30 minute) (/ float-pi 30)))
                     micro-clock-minute-hand-ratio))
        (minute-y (* radius (cos (* (- 30 minute) (/ float-pi 30)))
                     micro-clock-minute-hand-ratio))
        (svg (svg-create (* 2 radius) (* 2 radius) :stroke color)))
    (svg-circle svg radius radius (1- radius) :fill "none" :stroke-width 2)
    (svg-circle svg radius radius 1 :fill color :stroke "none")
    (svg-line svg radius radius (+ radius hour-x) (+ radius hour-y)
              :stroke-width 2)
    (svg-line svg radius radius (+ radius minute-x) (+ radius minute-y)
              :stroke-width 1.5)
    svg))
(require 'svg)

(defvar +doom-modeline-micro-clock-minute-resolution 1
  "The clock will be updated every this many minutes, truncating.")
(defvar +doom-modeline-micro-clock-inverse-size 4.8
  "The size of the clock, as an inverse proportion to the mode line height.")

(defvar +doom-modeline-micro-clock--cache nil)

(defvar +doom-modeline-clock-text-format "%c")

(defun +doom-modeline--clock-text (&optional _window _object _pos)
  (format-time-string +doom-modeline-clock-text-format))

(defun +doom-modeline-micro-clock ()
  "Return a string containing an current analogue clock."
  (cdr
   (if (equal (truncate (float-time)
                        (* +doom-modeline-micro-clock-minute-resolution 60))
              (car +doom-modeline-micro-clock--cache))
       +doom-modeline-micro-clock--cache
     (setq +doom-modeline-micro-clock--cache
           (cons (truncate (float-time)
                           (* +doom-modeline-micro-clock-minute-resolution 60))
                 (with-temp-buffer
                   (svg-insert-image
                    (micro-clock-svg
                     (string-to-number (format-time-string "%-I")) ; hour
                     (* (truncate (string-to-number (format-time-string "%-M"))
                                  +doom-modeline-micro-clock-minute-resolution)
                        +doom-modeline-micro-clock-minute-resolution) ; minute
                     (/ doom-modeline-height +doom-modeline-micro-clock-inverse-size) ; radius
                     "currentColor"))
                   (propertize
                    " "
                    'display
                    (append (get-text-property 0 'display (buffer-string))
                            '(:ascent center))
                    'face 'doom-modeline-time
                    'help-echo #'+doom-modeline--clock-text)))))))
(doom-modeline-def-segment time
  (when (and doom-modeline-time
             (bound-and-true-p display-time-mode)
             (not doom-modeline--limited-width-p))
    (concat
     doom-modeline-spc
     (when doom-modeline-time-icon
       (concat
        (+doom-modeline-micro-clock)
        (and (or doom-modeline-icon doom-modeline-unicode-fallback)
             doom-modeline-spc)))
     (propertize display-time-string
                 'face (doom-modeline-face 'doom-modeline-time)))))
(doom-modeline-def-segment buffer-name
  "Display the current buffer's name, without any other information."
  (concat
   doom-modeline-spc
   (doom-modeline--buffer-name)))

(doom-modeline-def-segment pdf-icon
  "PDF icon from nerd-icons."
  (concat
   doom-modeline-spc
   (doom-modeline-icon sucicon "nf-seti-pdf" nil nil
                       :face (if (doom-modeline--active)
                                 'nerd-icons-red
                               'mode-line-inactive)
                       :v-adjust 0.02)))

(defun doom-modeline-update-pdf-pages ()
  "Update PDF pages."
  (setq doom-modeline--pdf-pages
        (let ((current-page-str (number-to-string (eval `(pdf-view-current-page))))
              (total-page-str (number-to-string (pdf-cache-number-of-pages))))
          (concat
           (propertize
            (concat (make-string (- (length total-page-str) (length current-page-str)) ? )
                    " P" current-page-str)
            'face 'mode-line)
           (propertize (concat "/" total-page-str) 'face 'doom-modeline-buffer-minor-mode)))))

(doom-modeline-def-segment pdf-pages
  "Display PDF pages."
  (if (doom-modeline--active) doom-modeline--pdf-pages
    (propertize doom-modeline--pdf-pages 'face 'mode-line-inactive)))

(doom-modeline-def-modeline 'pdf
  '(bar window-number pdf-pages pdf-icon buffer-name)
  '(misc-info matches major-mode process vcs))

(provide 'config--pkg-doom-modeline)
;;; config--pkg-doom-modeline.el ends here
