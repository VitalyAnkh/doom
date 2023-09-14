;;; config--pkg-magit.el --- Generated package (no.26) from my config -*- lexical-binding: t; -*-
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
;;  Generated package (no.26) from my config.
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

(defvar +magit-project-commit-templates-alist nil
  "Alist of toplevel dirs and template hf strings/functions.")
(after! magit
  (defvar +magit-default-forge-remote "gitea@git.tecosaur.net:tec/%s.git"
  "Format string that fills out to a remote from the repo name.
Set to nil to disable this functionality.")
(defadvice! +magit-remote-add--streamline-forge-a (args)
  :filter-args #'magit-remote-add
  (interactive
   (or (and +magit-default-forge-remote
            (not (magit-list-remotes))
            (eq (read-char-choice
                 (format "Setup %s remote? [y/n]: "
                         (replace-regexp-in-string
                          "\\`\\(?:[^@]+@\\|https://\\)\\([^:/]+\\)[:/].*\\'" "\\1"
                          +magit-default-forge-remote))
                 '(?y ?n))
                ?y)
            (let* ((default-name
                     (subst-char-in-string ?\s ?-
                                           (file-name-nondirectory
                                            (directory-file-name (doom-project-root)))))
                   (name (read-string "Name: " default-name)))
              (list "origin" (format +magit-default-forge-remote name)
                    (transient-args 'magit-remote))))
       (let ((origin (magit-get "remote.origin.url"))
             (remote (magit-read-string-ns "Remote name"))
             (gh-user (magit-get "github.user")))
         (when (and (equal remote gh-user)
                    (string-match "\\`https://github\\.com/\\([^/]+\\)/\\([^/]+\\)\\.git\\'"
                                  origin)
                    (not (string= (match-string 1 origin) gh-user)))
           (setq origin (replace-regexp-in-string
                         "\\`https://github\\.com/" "git@github.com:"
                         origin)))
         (list remote
               (magit-read-url
                "Remote url"
                (and origin
                     (string-match "\\([^:/]+\\)/[^/]+\\(\\.git\\)?\\'" origin)
                     (replace-match remote t t origin 1)))
               (transient-args 'magit-remote)))))
  args)
(defun +magit-fill-in-commit-template ()
  "Insert template from `+magit-fill-in-commit-template' if applicable."
  (when-let ((template (and (save-excursion (goto-char (point-min)) (string-match-p "\\`\\s-*$" (thing-at-point 'line)))
                            (cdr (assoc (file-name-base (directory-file-name (magit-toplevel)))
                                        +magit-project-commit-templates-alist)))))
    (goto-char (point-min))
    (insert (if (stringp template) template (funcall template)))
    (goto-char (point-min))
    (end-of-line)))
(add-hook 'git-commit-setup-hook #'+magit-fill-in-commit-template 90)
(defun +org-commit-message-template ()
  "Create a skeleton for an Org commit message based on the staged diff."
  (let (change-data last-file file-changes temp-point)
    (with-temp-buffer
      (apply #'call-process magit-git-executable
             nil t nil
             (append
              magit-git-global-arguments
              (list "diff" "--cached")))
      (goto-char (point-min))
      (while (re-search-forward "^@@\\|^\\+\\+\\+ b/" nil t)
        (if (looking-back "^\\+\\+\\+ b/" (line-beginning-position))
            (progn
              (push (list last-file file-changes) change-data)
              (setq last-file (buffer-substring-no-properties (point) (line-end-position))
                    file-changes nil))
          (setq temp-point (line-beginning-position))
          (re-search-forward "^\\+\\|^-" nil t)
          (end-of-line)
          (cond
           ((string-match-p "\\.el$" last-file)
            (when (re-search-backward "^\\(?:[+-]? *\\|@@[ +-\\d,]+@@ \\)(\\(?:cl-\\)?\\(?:defun\\|defvar\\|defmacro\\|defcustom\\)" temp-point t)
              (re-search-forward "\\(?:cl-\\)?\\(?:defun\\|defvar\\|defmacro\\|defcustom\\) " nil t)
              (add-to-list 'file-changes (buffer-substring-no-properties (point) (forward-symbol 1)))))
           ((string-match-p "\\.org$" last-file)
            (when (re-search-backward "^[+-]\\*+ \\|^@@[ +-\\d,]+@@ \\*+ " temp-point t)
              (re-search-forward "@@ \\*+ " nil t)
              (add-to-list 'file-changes (buffer-substring-no-properties (point) (line-end-position)))))))))
    (push (list last-file file-changes) change-data)
    (setq change-data (delete '(nil nil) change-data))
    (concat
     (if (= 1 (length change-data))
         (replace-regexp-in-string "^.*/\\|.[a-z]+$" "" (caar change-data))
       "?")
     ": \n\n"
     (mapconcat
      (lambda (file-changes)
        (if (cadr file-changes)
            (format "* %s (%s): "
                    (car file-changes)
                    (mapconcat #'identity (cadr file-changes) ", "))
          (format "* %s: " (car file-changes))))
      change-data
      "\n\n"))))

(add-to-list '+magit-project-commit-templates-alist (cons "org" #'+org-commit-message-template)))

(provide 'config--pkg-magit)
;;; config--pkg-magit.el ends here
