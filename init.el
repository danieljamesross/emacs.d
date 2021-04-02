;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                     (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

(require 'package)
(setq package-enable-at-startup 't)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(defadvice en/disable-command (around put-in-custom-file activate)
  "Put declarations in `custom-file'."
  (let ((user-init-file custom-file))
    ad-do-it))
(setq custom-file (expand-file-name "~/.emacs.d/djr-custom.el"))
(load custom-file)
(set-variable 'meta-flag 't)
(define-key esc-map "?" 'describe-key-briefly)
(require 'saveplace)
(setq-default save-place t)
(setq make-backup-files nil)
(setq debug-on-error t)
(setq case-fold-search t)
;; ignore case when switching buffers with C-x b
(setq read-buffer-completion-ignore-case t)
(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode 1)
(setq ead-buffer-completion-ignore-case t)

;;(when (display-graphic-p)
  (org-babel-load-file (expand-file-name "~/.emacs.d/README.org"));)
(put 'upcase-region 'disabled nil)

(server-start)
;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
