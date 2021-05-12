(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(css-indent-offset 2 t)
 '(custom-enabled-themes '(deeper-blue))
 '(custom-safe-themes
   '("da31d302512d3642bc14c68a5040beae151b0b88b79aabde718141c149027563" "81c3de64d684e23455236abde277cda4b66509ef2c28f66e059aa925b8b12534" default))
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
 '(global-linum-mode nil)
 '(highlight-indent-guides-auto-character-face-perc 15)
 '(highlight-indent-guides-method 'character)
 '(indicate-buffer-boundaries 'left)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(js-indent-level 2)
 '(markdown-command "/usr/local/bin/pandoc")
 '(ns-tool-bar-display-mode 'both)
 '(ns-tool-bar-size-mode 'regular)
 '(one-buffer-one-frame-mode nil)
 '(org-agenda-files (list org-directory))
 '(org-directory (expand-file-name "~/org"))
 '(org-log-into-drawer nil)
 '(org-support-shift-select t)
 '(package-selected-packages
   '(reformatter lsp-mode company gnu-elpa-keyring-update multiple-cursos shader-mode multiple-cursors org-jira command-log-mode auto-package-update highlight-indent-guides eslint-fix fill-column-indicator quelpa-use-package quelpa use-package dracula-theme kintaro kintaro-mode scss-mode lorem-ipsum yaml-mode jinja2-mode cl-lib emacs-sos projectile dired-sidebar add-node-modules-path eshell-syntax-highlighting tide fira-code-mode unicode-fonts auto-indent-mode org-bullets xkcd prettier-js sos paredit js-auto-beautify csv-mode default-text-scale lsp-ui json-mode js2-mode transpose-frame flycheck emmet-mode js-comint fast-scroll buffer-move magit multi-term telephone-line exec-path-from-shell latex-pretty-symbols latex-preview-pane markdown-mode ac-slime ox-reveal dimmer slime-repl-ansi-color rainbow-delimiters smartparens lisp-extra-font-lock web-mode auto-complete slime))
 '(safe-local-variable-values '((base . 10) (package . clm) (syntax . common-lisp)))
 '(show-paren-mode t)
 '(telephone-line-mode t)
 '(tool-bar-mode nil)
 '(typescript-indent-level 2)
 '(visual-line-mode nil t)
 '(zoom-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "gray20"))))
 '(telephone-line-accent-active ((t (:inherit mode-line :background "coral3" :foreground "white")))))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
