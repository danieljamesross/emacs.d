(deftheme djr-cobalt
  "Created 2020-06-03.")

(custom-theme-set-variables
 'djr-cobalt
 '(aquamacs-additional-fontsets nil)
 '(aquamacs-customization-version-id 312)
 '(aquamacs-tool-bar-user-customization nil)
 '(custom-safe-themes (quote ("a1c5ddb21c09ab6a9f99c22de10290040034fdb3bd9a48f736a0d0f19812a79f" default)))
 '(ns-tool-bar-display-mode (quote both))
 '(ns-tool-bar-size-mode (quote regular))
 '(package-selected-packages (quote (org-re-reveal ox-reveal ox-latex-subfigure popup-imenu flyspell-correct-popup ac-slime popup-complete org-bullets md4rd hydra eslint-fix flylisp ## 0blayout adjust-parens font-lock-cl pandoc json-mode emmet-mode add-node-modules-path prettier-js flycheck web-mode react-snippets processing-mode csharp-mode paredit fast-scroll latex-preview-pane electric-indent-mode cl-libify rainbow-delimiters magit dimmer color-theme-modern twittering-mode slime-repl-ansi-color lisp-extra-font-lock js-comint multi-web-mode use-package xref-js2 xpath xml xkcd w3 string-utils smartparens slime shader-mode org iplayer haskell-emacs-base eww-lnum ein dashboard dash-functional cl-lib-highlight bibretrieve auto-auto-indent auctex-latexmk)))
 '(visual-line-mode nil)
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(tool-bar-mode nil)
 '(tabbar-mode t)
 '(one-buffer-one-frame-mode nil))

(custom-theme-set-faces
 'djr-cobalt
 '(fundamental-mode-default ((t (:inherit autoface-default))))
 '(special-mode-default ((t (:inherit autoface-default))))
 '(messages-buffer-mode-default ((t (:inherit special-mode-default))))
 '(border ((t (:foreground "Purple"))))
 '(echo-area ((t (:stipple nil :foreground "Yellow" :strike-through nil :underline nil :slant normal :weight normal :width normal :family "Lucida Grande"))))
 '(highlight ((t (:background "selectedMenuItemColor"))))
 '(hl-line ((t (:background "Black"))))
 '(linum ((t (:background "#102548" :foreground "knobColor" :underline nil))))
 '(mode-line-buffer-id ((t (:foreground "Yellow" :weight bold))))
 '(region ((t (:background "selectedKnobColor"))))
 '(show-paren-match ((t (:background "Blue" :foreground "Yellow"))))
 '(slime-repl-input-face ((t (:weight normal))))
 '(prog-mode-default ((t (:inherit autoface-default))))
 '(emacs-lisp-mode-default ((t (:inherit prog-mode-default))))
 '(text-mode-default ((t (:inherit autoface-default :stipple nil :strike-through nil :underline nil :slant normal :weight normal :height 130 :width normal :family "Lucida Grande"))))
 '(custom-theme-choose-mode-default ((t (:inherit special-mode-default))))
 '(custom-new-theme-mode-default ((t (:inherit autoface-default)))))

(provide-theme 'djr-cobalt)
