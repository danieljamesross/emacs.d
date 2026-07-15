;;; -*- lexical-binding: t; -*-
;; GC threshold and file-name-handler-alist startup tweaks live in early-init.el.

(setq user-emacs-directory (expand-file-name "~/.emacs.d/"))

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

(defun compile-org-or-load-precompiled-el (file-name)
  "Tangle FILE-NAME.org -> .el when the org source has changed, byte-compile
it, then load the result, preferring the .elc.  FILE-NAME is relative to
`user-emacs-directory'.

Staleness is decided with `file-newer-than-file-p', which uses the full
file-modification timestamp.  (The previous implementation truncated mtimes
to whole seconds, so an edit and a prior tangle that landed in the same
second compared as equal and the edit was silently dropped.)

If byte-compilation fails it returns nil without signalling, leaving the
.elc missing or stale; in that case we fall back to loading the .el source
and simply retry the compile on the next startup -- no manual deletion of
the .el/.elc files is required to pick up an org edit."
  (let* ((base (expand-file-name file-name user-emacs-directory))
         (org  (concat base ".org"))
         (el   (concat base ".el"))
         (elc  (concat base ".elc")))
    ;; (Re)tangle whenever the org source is newer than the tangled .el
    ;; (file-newer-than-file-p also returns t when .el is missing).
    (when (file-newer-than-file-p org el)
      (message "tangling %s" org)
      (require 'ob-tangle)
      (org-babel-tangle-file org el "emacs-lisp")
      ;; org-babel-tangle-file may skip rewriting an unchanged .el; force its
      ;; mtime past the .org so this edit is recorded as processed.
      (when (file-exists-p el)
        (set-file-times el)))
    ;; (Re)compile whenever the .elc is missing or older than the .el.
    (when (and (file-exists-p el)
               (file-newer-than-file-p el elc))
      (message "byte-compiling %s" el)
      (byte-compile-file el))
    ;; Load the .elc when it is current, otherwise fall back to .el source.
    (cond
     ((file-newer-than-file-p elc el)
      (message "loading %s" elc)
      (load elc nil 'nomessage))
     ((file-exists-p el)
      (message "loading %s (uncompiled)" el)
      (load el nil 'nomessage))
     (t
      (error "Cannot load %s: neither %s nor %s exists" file-name el elc)))))

(compile-org-or-load-precompiled-el "functions")

(require 'package)

;; package-enable-at-startup is set in early-init.el (setting it here is too
;; late to have any effect); djr/online-p is defined in functions.el.

(when djr/online-p
  (add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/")))

;; Bootstrap `use-package'.  The package argument must be a SYMBOL: with the
;; old string argument this check failed every startup, forcing a blocking
;; package-refresh-contents on each launch -- and when ELPA/network glitched,
;; the error aborted the rest of init (no README, no keybindings, no Claude).
;; The condition-case keeps a failed install attempt from ever doing that.
(unless (package-installed-p 'use-package)
  (if djr/online-p
      (condition-case err
          (progn
            (message "no use-package, installing...")
            (package-refresh-contents)
            (package-install 'use-package))
        (error (message "use-package bootstrap failed: %s"
                        (error-message-string err))))
    (message "Cannot install use-package, internet is down")))

;; (package-initialize)

(setq use-package-always-ensure djr/online-p)

(defadvice en/disable-command (around put-in-custom-file activate)
  "Put declarations in `custom-file'."
  (let ((user-init-file custom-file))
    ad-do-it))

;; vterm's compiled C module (vterm-module.so) is deleted whenever
;; auto-package-update reinstalls vterm.  Loading vterm then prompts
;; "Compile it now?" -- and while README.el is being byte-compiled,
;; use-package loads vterm at compile time from every vterm-dependent block
;; (vterm, multi-vterm, claude-code-ide), so the prompt fires three times and
;; each attempt fails because exec-path-from-shell hasn't run yet and a
;; Dock-launched Emacs can't find homebrew's cmake.  Compile silently instead,
;; and make cmake findable this early: `executable-find' consults exec-path,
;; while vterm's actual build runs via "sh -c", which needs PATH.
(setq vterm-always-compile-module t)
(unless (member "/opt/homebrew/bin" exec-path)
  (add-to-list 'exec-path "/opt/homebrew/bin"))
(let ((path (or (getenv "PATH") "")))
  (unless (string-match-p "/opt/homebrew/bin" path)
    (setenv "PATH" (concat "/opt/homebrew/bin:" path))))

(compile-org-or-load-precompiled-el "README")

;; gc-cons-threshold is restored to a sane value via emacs-startup-hook in early-init.el.

(require 'server)
(unless (server-running-p)
  (server-start))

;(popper--bury-all)
(add-hook 'emacs-startup-hook #'recentf-open-files)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-display-line-numbers-mode t)
 '(org-agenda-files (list org-directory))
 '(org-babel-python-command "python3")
 '(org-directory (expand-file-name "~/org"))
 '(package-selected-packages nil)
 '(package-vc-selected-packages
   '((claude-code-ide :url "https://github.com/manzaltu/claude-code-ide.el")
     (lilypond :url "https://github.com/jmgpena/lilypond-mode.git")
     (antesc :url "https://github.com/programLyrique/antesc-mode.git")))
 '(safe-local-variable-values '((Base . 10) (Package . CL-PPCRE) (Syntax . COMMON-LISP)))
 '(tool-bar-mode nil)
 '(zoom-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
