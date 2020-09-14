(require 'package)
(setq package-enable-at-startup 't)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/README.org"))
(put 'upcase-region 'disabled nil)
