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

(setq package-enable-at-startup t)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (message "no use-package, installing...")
  (package-refresh-contents)
  (package-install 'use-package))

(defadvice en/disable-command (around put-in-custom-file activate)
  "Put declarations in `custom-file'."
  (let ((user-init-file custom-file))
    ad-do-it))

(org-babel-load-file (expand-file-name (concat user-emacs-directory "README.org")))

(server-start)

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
