;;; config-setup-script-prompt.el --- Generated package (no.12) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.12) from my config.
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
