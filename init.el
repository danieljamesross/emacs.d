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

(defun last-modified (file)
  (let* ((file-attrs (file-attributes (expand-file-name file)))
	 (last-mod-time (nth 5 file-attrs)))
    (time-convert last-mod-time 'integer)))

(defun check-newer-than (file1 file2)
  (let ((lm1 (last-modified file1))
        (lm2 (last-modified file2)))
    (if (and (numberp lm1) (numberp lm2))
        (> lm1 lm2)
      nil)))

(defun compile-org-or-load-precompiled-el (file-name)
  "Tangle/byte-compile `file-name'.org if it has changed, then load the
result. Prefers .elc over .el. `file-name' is relative to `user-emacs-directory'."
  (let* ((file (concat user-emacs-directory file-name))
         (org (concat file ".org"))
         (el (concat file ".el"))
         (elc (concat file ".elc")))
    (cond
     ;; .org newer than .el (or no .el yet): tangle, compile, and load via org-babel
     ((or (not (file-exists-p el))
          (check-newer-than org el))
      (message "tangling and byte-compiling %s" org)
      (org-babel-load-file org)
      (when (file-exists-p el)
        (byte-compile-file el)))
     ;; .el newer than .elc (rare — manual edit of tangled file): recompile then load .elc
     ((or (not (file-exists-p elc))
          (check-newer-than el elc))
      (message "byte-compiling %s" el)
      (byte-compile-file el)
      (load (file-name-sans-extension el) nil 'nomessage))
     ;; .elc is current: load it
     (t
      (message "loading %s" elc)
      (load (file-name-sans-extension el) nil 'nomessage)))))

(compile-org-or-load-precompiled-el "functions")

(require 'package)

(setq package-enable-at-startup t
      djr/online-p (internet-up-p))

;; Bootstrap `use-package'
(unless (package-installed-p "use-package")
  (if djr/online-p
      (progn
	(message "no use-package, installing...")
	(package-refresh-contents)
	(package-install 'use-package))
    (message "Cannot install use-package, internet is down")))

(when djr/online-p
  (add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/")))

;; (package-initialize)

(setq use-package-always-ensure djr/online-p)

(defadvice en/disable-command (around put-in-custom-file activate)
  "Put declarations in `custom-file'."
  (let ((user-init-file custom-file))
    ad-do-it))

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
   '((lilypond :url "https://github.com/jmgpena/lilypond-mode.git")
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
