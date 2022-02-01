;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

(set-background-color "#2d2c2d")

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

(defun last-modified (file)
  (let ((last-mod-time (sixth (file-attributes (expand-file-name file)))))
    (time-convert last-mod-time 'integer)))

(defun check-newer-than (file1 file2)
  (let ((lm1 (last-modified file1))
        (lm2 (last-modified file2)))
    (if (and (numberp lm1) (numberp lm2))
        (> lm1 lm2)
      nil)))

(defun compile-org-or-load-precompiled-el (file-name)
  "org-babel-load `file-name' if has been edited recently, otherwise load the already
  compiled .el file. `file-name' is in `user-emacs-directory'."
  (let* ((file (concat user-emacs-directory file-name))
         (org (concat file ".org"))
         (el (concat file ".el")))
    (if (or (not (file-exists-p el))
	    (check-newer-than org el))
        (progn
          (message (format "loading %s" org))
          (org-babel-load-file org))
      (progn
        (message (format "loading %s" el))
        (load-file el)))))

(compile-org-or-load-precompiled-el "functions")

(require 'package)

(setq package-enable-at-startup t)

(when (internet-up-p)
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/")))

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (if (internet-up-p)
      (progn
	(message "no use-package, installing...")
	(package-refresh-contents)
	(package-install 'use-package))
    (message "Cannot install use-package, internet is down")))

(setq use-package-always-ensure (internet-up-p))

(defadvice en/disable-command (around put-in-custom-file activate)
  "Put declarations in `custom-file'."
  (let ((user-init-file custom-file))
    ad-do-it))

(compile-org-or-load-precompiled-el "README")

(require 'server)
(unless (server-running-p)
  (server-start))

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
