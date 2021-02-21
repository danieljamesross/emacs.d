(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(css-indent-offset 2)
 '(custom-enabled-themes '(deeper-blue))
 '(debug-on-error t)
 '(dired-sidebar-icon-scale 0.1)
 '(dired-sidebar-mode-line-format
   '("%e" mode-line-front-space mode-line-buffer-identification " " mode-line-end-spaces))
 '(dired-sidebar-recenter-cursor-on-tui-update nil)
 '(dired-sidebar-should-follow-file t)
 '(dired-sidebar-toggle-hidden-commands '(rotate-windows toggle-window-split balance-windows))
 '(display-line-numbers t)
 '(fringe-mode '(nil . 0) nil (fringe))
 '(global-hl-line-mode t)
 '(indicate-buffer-boundaries 'left)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(js-indent-level 2)
 '(markdown-command "/usr/local/bin/pandoc")
 '(org-agenda-files (list org-directory))
 '(org-directory (expand-file-name "~/org"))
 '(org-log-into-drawer nil)
 '(package-selected-packages
   '(reformatter xah-replace-pairs xah-css-mode eslint-fix cl-lib emacs-sos projectile vscode-icon dired-sidebar add-node-modules-path company eshell-syntax-highlighting tide fira-code-mode unicode-fonts auto-indent-mode org-bullets xkcd zoom prettier-js sos paredit js-auto-beautify csv-mode default-text-scale lsp-ui lsp-mode json-mode js2-mode transpose-frame flycheck emmet-mode js-comint fast-scroll buffer-move whitespace-cleanup-mode magit multi-term telephone-line exec-path-from-shell latex-pretty-symbols latex-preview-pane markdown-mode ac-slime tabbar auctex ox-reveal dimmer slime-repl-ansi-color rainbow-delimiters smartparens lisp-extra-font-lock web-mode auto-complete slime))
 '(safe-local-variable-values '((base . 10) (package . clm) (syntax . common-lisp)))
 '(show-paren-mode t)
 '(telephone-line-mode t)
 '(tool-bar-mode nil)
 '(typescript-indent-level 2)
 '(zoom-mode t nil (zoom)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "gray20"))))
 '(telephone-line-accent-active ((t (:inherit mode-line :background "coral3" :foreground "white")))))
(put 'downcase-region 'disabled nil)
