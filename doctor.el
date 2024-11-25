;;; doctor.el -*- lexical-binding: t; no-byte-compile: t; -*-

(unless (string= "enabled\n" (shell-command-to-string "systemctl --user is-enabled emacs.service"))
  (warn! "Emacsclient service is not enabled."))

(unless (executable-find "hunspell")
  (warn! "Couldn't find hunspell executable."))
(unless (file-exists-p "~/.local/share/hunspell/en-custom.dic")
  (warn! "Custom hunspell dictionary is not present."))

(unless (executable-find "aspell")
  (warn! "Couldn't find aspell executable."))
(unless (file-exists-p "~/.config/enchant/aspell/en-custom.multi")
  (warn! "Custom aspell dictionary is not present."))

(unless (executable-find "wal")
  (warn! "Couldn't find the pywal executable (wal), theme-magic will not function."))

(if (executable-find "sdcv")
    (let ((dict-root (concat (or (getenv "STARDICT_DATA_DIR")
                                 (concat (or "~/.local/share"
                                             (getenv "XDG_DATA_HOME"))
                                         "/stardict"))
                             "/dic"))
          (dicts '("webster" "synonyms" "etymology" "en-to-latin" "hitchcock" "elements")))
      (if (file-exists-p dict-root)
          (dolist (dict dicts)
            (unless (file-exists-p (file-name-concat dict-root dict))
              (warn! (format "Absent sdcv dictionary: %s." dict))))
        (warn! "Couldn't find any stcv dictionaries, lexic will not function")))
  (warn! "Couldn't find sdcv executable, lexic will be disabled"))
(when (file-exists-p "~/.mail") ; We care about mail when the mail folder exists
  (unless (executable-find "mu")
    (error! "Couldn't find mail dependency mu."))
  (unless (executable-find "mbsync")
    (error! "Couldn't find mail dependency mbsync."))
  (unless (executable-find "msmtp")
    (error! "Couldn't find mail dependency msmtp."))
  (unless (executable-find "goimapnotify")
    (warn! "Couldn't find mail helper goimapnotify, mail syncs will be slower.")))

(when (and (executable-find "goimapnotify")
           (not (file-exists-p "~/.config/imapnotify")))
  (warn! "goimapnotify is installed but not configured."))

(when (executable-find "mbsync")
  (unless (string= "enabled\n" (shell-command-to-string "systemctl --user is-enabled mbsync.timer"))
    (warn! "The mbsync timer is not enabled.")))

(when (and (executable-find "mu")
           (not (string= (shell-command-to-string "xdg-mime query default x-scheme-handler/mailto")
                         "emacsmail.desktop\n")))
  (warn! "Emacs is not registered as a mailto handler."))
(if (string= (shell-command-to-string "xdg-mime query default text/org") "")
  (warn! "text/org is not a registered mime type.")
  (unless (string= (shell-command-to-string "xdg-mime query default text/org") "emacs-client.desktop\n")
    (warn! "Emacs(client) is not set up as the text/org handler.")))
(unless (executable-find "latex2text")
  (warn! "Couldn't find latex2text executable (from pylatexenc), will be unable to render LaTeX fragments in org→text exports."))
