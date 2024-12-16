;;; config-setup-script-prompt.el --- Generated package (no.12) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.12) from my config.
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

;; (if (file-exists-p "setup.sh")
;;     (if (string-empty-p (string-trim (with-temp-buffer (insert-file-contents "setup.sh") (buffer-string)) "#!/usr/bin/env bash"))
;;         (message ";; Setup script is empty")
;;       (message ";; Detected content in the setup script")
;;       (pp-to-string
;;        `(unless noninteractive
;;           (defun +config-run-setup ()
;;             (when (yes-or-no-p (format "%s The setup script has content. Check and run the script?"
;;                                        (propertize "Warning!" 'face '(bold warning))))
;;               (find-file (expand-file-name "setup.sh" doom-user-dir))
;;               (when (yes-or-no-p "Would you like to run this script?")
;;                 (async-shell-command "./setup.sh"))))
;;           (add-hook! 'doom-init-ui-hook
;;             (run-at-time nil nil #'+config-run-setup)))))
;;   (message ";; setup.sh did not exist during tangle. Tangle again.")
;;   (pp-to-string
;;    `(unless noninteractive
;;       (add-hook! 'doom-init-ui-hook #'+literate-tangle-async-h))))

nil

(provide 'config-setup-script-prompt)
;;; config-setup-script-prompt.el ends here
