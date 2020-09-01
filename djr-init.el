(setenv "PATH" (concat "/Library/TeX/texbin:"
                     (getenv "PATH")))
(add-to-list 'exec-path "/Library/TeX/texbin")
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(defalias 'pi 'package-install)
(defalias 'pl 'package-list-packages)
(defalias 'pr 'package-refresh-contents)
(defalias 'wm 'web-mode)
(defalias 'j2 'js2-mode)
(defalias 'mt 'multi-term)
(defalias 'rb 'revert-buffer)
(defalias 'scd 'sc-deftest-template)
(defalias 'tf 'transpose-frame)
(defalias 'rbp 'react-boilerplate)

(global-set-key "\M-3" '(lambda() (interactive) (insert "#")))
(global-set-key (kbd "C-c n") #'djr-new-buffer-frame)
(global-set-key "\C-c\l" 'goto-line)
(global-set-key "\C-x\l" '(lambda () (interactive)
			    (switch-to-buffer "*slime-repl sbcl*")))
(global-set-key (kbd "C-x C-b") 'ibuffer) ;; Use Ibuffer for Buffer List
(global-set-key "\C-c\ib" 'ibuffer)
;; Becasue I just can't quite those MacOS bindings, and why should I?
(global-set-key (kbd "s-<right>") 'move-end-of-line)
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)
(global-set-key (kbd "s-<up>") 'beginning-of-buffer)
(global-set-key (kbd "s-<down>") 'end-of-buffer)
(global-set-key (kbd "M-<up>") 'scroll-down-command)
(global-set-key (kbd "M-<down>") 'scroll-up-command)
(global-set-key (kbd "s-w") 'delete-frame)
(global-set-key (kbd "s-<backspace>") 'kill-whole-line)
;; Resize Windows
(global-set-key (kbd "S-s-C-<down>") 'shrink-window-horizontally)
(global-set-key (kbd "S-s-C-<up>") 'enlarge-window-horizontally)
(global-set-key (kbd "s-C-<down>") 'shrink-window)
(global-set-key (kbd "s-C-<up>") 'enlarge-window)

(require 'buffer-move)
(global-set-key (kbd "<C-M-up>")     'buf-move-up)
(global-set-key (kbd "<C-M-down>")   'buf-move-down)
(global-set-key (kbd "<C-M-left>")   'buf-move-left)
(global-set-key (kbd "<C-M-right>")  'buf-move-right)

(setq default-frame-alist
    (add-to-list 'default-frame-alist '(width . 100)))
(setq default-frame-alist
    (add-to-list 'default-frame-alist '(height . 200)))

;;; Use the commands "control+x" followed by an arrow to
;;; navigate between panes
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

(custom-set-variables
 '(zoom-mode t))

;; font scaling
(use-package default-text-scale
  :ensure t
  :config
  (global-set-key (kbd "s-=") 'default-text-scale-increase)
  (global-set-key (kbd "s--") 'default-text-scale-decrease))

(setq auto-mode-alist
      (append '(("\\.c$"       . c-mode)
		("\\.cs$"      . csharp-mode)
		("\\.txt$"     . text-mode)
		("\\.md$"      . markdown-mode)
		("\\.cpp$"     . c++-mode)
		("\\.CPP$"     . c++-mode)
		("\\.h$"       . c-mode)
		("\\.lsp$"     . lisp-mode)
		("\\.cl$"      . lisp-mode)
		("\\.cm$"      . lisp-mode)
		("\\.lisp$"    . lisp-mode)
		("\\.clm$"     . lisp-mode)
		("\\.ins$"     . lisp-mode)
		("\\.el$"      . lisp-mode)
		("\\.el.gz$"   . lisp-mode)
		("\\.ws$"      . lisp-mode)
		("\\.asd$"     . lisp-mode)
		("\\.py$"      . python-mode)
		("\\.ly$"      . lilypond-mode)
		("\\.js$"      . js2-mode)
		("\\.json$"    . json-mode)
		("\\.jsx$"     . web-mode)
		("\\.html$"    . web-mode)
		("\\.ejs$"     . web-mode)
		("\\.htm$"     . web-mode)
		("\\.shtml$"   . web-mode)
		("\\.tex$"     . latex-mode)
		("\\.cls$"     . latex-mode)
		("\\.java$"    . java-mode)
		("\\.ascii$"   . text-mode)
		("\\.sql$"     . sql-mode)
		("\\.pl$"      . perl-mode)
		("\\.php$"     . php-mode)
		("\\.jxs$"     . shader-mode)
		("\\.sh$"      . shell-mode)
		("\\.gnuplot$"      . shell-mode))
	      auto-mode-alist))

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
(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode 1)

(add-to-list 'default-frame-alist '(font . "Monaco"))

(setq-default fill-column 80)
  (add-hook 'web-mode-hook
	    (lambda () (set (make-local-variable 'comment-auto-fill-only-comments) t)))
  (add-hook 'js2-mode-hook
	  (lambda () (set (make-local-variable 'comment-auto-fill-only-comments) t)))
  (toggle-text-mode-auto-fill)
  (add-hook 'lisp-mode-hook 'turn-on-auto-fill)

;;; utf-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; keybinding for this is in the key bindings menu
;; `C-c n'
(defun djr-new-buffer-frame ()
  "Create a new frame with a new empty buffer."
  (interactive)
  (let ((buffer (generate-new-buffer "untitled")))
    (set-buffer-major-mode buffer)
    (display-buffer buffer '(display-buffer-pop-up-frame . nil))))

(require 'fast-scroll)

(require 'dimmer)

(use-package dimmer
    :defer 1
    :config
    (setq dimmer-exclusion-predicates
	  '(helm--alive-p window-minibuffer-p echo-area-p))
    (setq dimmer-exclusion-regexp-list
	  '("^\\*[h|H]elm.*\\*" "^\\*Minibuf-[0-9]+\\*"
	    "^.\\*which-key\\*$" "^*Messages*" "*LV*"
	    "^*[e|E]cho [a|A]rea 0*" "*scratch*"
	    "transient")))

(dimmer-mode t)

(require 'telephone-line)
(setq telephone-line-lhs
      '((evil   . (telephone-line-evil-tag-segment))
	(accent . (telephone-line-vc-segment
		   telephone-line-erc-modified-channels-segment
		   telephone-line-process-segment))
	(nil    . (telephone-line-minor-mode-segment
		   telephone-line-buffer-segment))))
(setq telephone-line-rhs
      '((nil    . (telephone-line-misc-info-segment))
	(accent . (telephone-line-major-mode-segment))
	(evil   . (telephone-line-airline-position-segment))))
(telephone-line-mode t)

(require 'cl-lib)
(require 'color)

(defun sc-deftest-template ()
  (interactive)
  (insert "(sc-deftest test- ()")
  (newline)
  (insert "  (let* (())")
  (newline)
  (insert "    (sc-test-check ")
  (newline)
  (insert "    )))"))

(defun js-80-slash ()
  (interactive)
  (loop repeat 80 do (insert "/")))

(defun lisp-80-slash ()
  (interactive)
  (loop repeat 80 do (insert ";")))

(defun react-boilerplate (name)
  (interactive "sFunction Name: ")
  (js2-mode)
  (insert "import React from 'react';")
  (newline)
  (newline)
  (insert "function ")
  (insert name) 
  (insert "() {")
  (newline)
  (newline)
  (insert "    return ();")
  (newline)
  (insert "};")
  (newline)
  (newline)
  (insert "export default ")
  (insert name)
  (insert ";"))

(defun web-boilerplate (page-title)
  (interactive "sHTML Title: ")
  (web-mode)
  (insert "<!DOCTYPE html>")
  (newline)
  (insert "<html>")
  (newline)
  (insert "    <head>")
  (newline)
  (insert "	<title>")
  (insert page-title)
  (insert "</title>")
  (newline)
  (insert "    </head>")
  (newline)
  (insert "    <body>")
  (newline)
  (newline)
  (insert "       <h1>This is a Heading</h1>")
  (newline)
  (insert "        <p>This is a paragraph.</p>")
  (newline)
  (newline)
  (insert "    </body>")
  (newline)
  (insert "</html>"))

(defun elisp-depend-filename (fullpath)
  "Return filename without extension and path.
   FULLPATH is the full path of file."
  (file-name-sans-extension (file-name-nondirectory fullpath)))
(defun robodoc-fun ()
  ;; "Put robodoc code around a funciton definition"
  ;; (interactive "r")
  (interactive)
  (save-excursion
    (backward-sexp)
    (let* ((beg (point))
	   (end (progn (forward-sexp) (point)))
	   (name (buffer-substring beg end))
	   (buffer (elisp-depend-filename (buffer-file-name))) 
	   ;; (buffer-name))
	   ;; is this defun or defmethod
	   (letter (progn
		     (backward-sexp 2)
		     (let* ((beg (point))
			    (end (progn (forward-sexp) (point)))
			    (fun (buffer-substring beg end)))
		       ;; (insert (preceding-sexp))
		       (if (string= fun "defun")
			   "f"
			 "m")))))
      (beginning-of-line)
      (newline)
      (previous-line)
      (newline)
      (insert
       ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;")
      (newline)
      (insert ";;; ****" letter "* " buffer "/" name)
      ;; (insert ";;; ****" letter "*" buffer "/" name)
      (newline)
      ;; (insert ";;; FUNCTION")
      ;; (newline)
      (insert ";;; AUTHOR")
      (newline)
      (insert ";;; Daniel Ross (mr.danielross[at]gmail[dot]com) ")
      (newline)
      (insert ";;; ")
      (newline)
      (robodoc-fun-aux "DATE")
      (robodoc-fun-aux "DESCRIPTION")
      ;; (insert ";;; " name ":")
      ;; (newline)
      ;; (insert ";;;")
      ;; (newline)
      ;; (insert ";;;")
      ;; (newline)
      (robodoc-fun-aux "ARGUMENTS")
      (robodoc-fun-aux "OPTIONAL ARGUMENTS")
      (robodoc-fun-aux "RETURN VALUE")
      (insert ";;; EXAMPLE")
      (newline)
      (insert "#|")
      (newline)
      (newline)
      (insert "|#")
      (newline)
      (insert ";;; SYNOPSIS")
      (next-line)
      (forward-sexp 2)
      (newline)
      (insert ";;; ****"))))

(defun robodoc-fun-aux (tag)
  (insert ";;; " tag)
  (newline)
  (insert ";;; ")
  (newline)
  (insert ";;; ")
  (newline))

;; Antescofo text highlighting
;; Thanks to Pierre Donat-Bouillud
;; https://github.com/programLyrique/antesc-mode
(add-to-list 'load-path (expand-file-name "~/site-lisp/antesc-mode-master"))
(autoload 'antesc-mode "antesc-mode" "Major mode for editing Antescofo code" t)

;; Extensions for antescofo mode
(setq auto-mode-alist
      (append '(("\\.\\(score\\|asco\\)\\.txt$" . antesc-mode))
	      auto-mode-alist))

;; Antescofo text highlighting
;; Thanks to Pierre Donat-Bouillud
;; https://github.com/programLyrique/antesc-mode
;; lilypond mode
(add-to-list 'load-path (expand-file-name "~/site-lisp"))
(load (expand-file-name "~/site-lisp/lilypond-init.el"))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (setq ac-use-quick-help nil)
    (setq ac-quick-help-delay 0.1)
    (global-auto-complete-mode t)))
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;; flyspell
(setq flyspell-mode t)
;  (add-hook 'LaTeX-mode-hook '(flyspell-mode t))
(dolist (hook '(text-mode-hook markdown-mode-hook))
    (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(lisp-mode-hook web-mode-hook js2-mode-hook))
  (add-hook hook (lambda () (flyspell-prog-mode))))
(setq flyspell-issue-message-flag nil)
(defun flyspell-emacs-popup-textual (event poss word)
  "A textual flyspell popup menu."
  (require 'popup)
  (let* ((corrects (if flyspell-sort-corrections
		       (sort (car (cdr (cdr poss))) 'string<)
		     (car (cdr (cdr poss)))))
	 (cor-menu (if (consp corrects)
		       (mapcar (lambda (correct)
				 (list correct correct))
			       corrects)
		     '()))
	 (affix (car (cdr (cdr (cdr poss)))))
	 show-affix-info
	 (base-menu  (let ((save (if (and (consp affix) show-affix-info)
				     (list
				      (list (concat "Save affix: " (car affix))
					    'save)
				      '("Accept (session)" session)
				      '("Accept (buffer)" buffer))
				   '(("Save word" save)
				     ("Accept (session)" session)
				     ("Accept (buffer)" buffer)))))
		       (if (consp cor-menu)
			   (append cor-menu (cons "" save))
			 save)))
	 (menu (mapcar
		(lambda (arg) (if (consp arg) (car arg) arg))
		base-menu)))
    (cadr (assoc (popup-menu* menu :scroll-bar t) base-menu))))
(eval-after-load "flyspell"
  '(progn
     (fset 'flyspell-emacs-popup 'flyspell-emacs-popup-textual)))

(require 'flycheck)
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint json-jsonlist)))
;; Enable eslint checker for web-mode
(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-eslint 'js2-mode)

;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
(let ((sbcl-local (car (file-expand-wildcards
			"/usr/local/Cellar/sbcl/*/lib/sbcl/sbcl.core"))))
  (setq slime-lisp-implementations
	`((sbcl ("/usr/local/bin/sbcl"
		 "--core"
		 ;; replace with correct path of sbcl
		 ,sbcl-local
		 "--dynamic-space-size" "2147")))))

;; slime
(require 'slime)
(require 'slime-autoloads)
;; Also setup the slime-fancy contrib
(add-to-list 'slime-contribs 'slime-fancy)
(add-hook 'slime-repl-mode-hook 'slime-repl-ansi-color-mode)
(slime-setup)
(with-eval-after-load 'slime-repl
  (require 'slime-repl-ansi-color))

;; (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;; (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
;; (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
;; (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
;; (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
;; (add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
;; ;; Stop SLIME's REPL from grabbing DEL,
;; ;; which is annoying when backspacing over a '('
;; (defun override-slime-repl-bindings-with-paredit ()
;;   (define-key slime-repl-mode-map
;;     (read-kbd-macro paredit-backward-delete-key) nil))
;; (add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

;; (require 'smartparens-config)
;; (add-hook 'web-mode-hook #'smartparens-mode)
;; (add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
;; (add-hook 'lisp-mode-hook #'smartparens-mode)
;; (add-hook 'latex-mode-hook #'SMARTPARENS-MODE)

(require 'lisp-extra-font-lock)
(lisp-extra-font-lock-global-mode 1)
(font-lock-add-keywords
 'emacs-lisp-mode
 '(("(\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)\\_>"
    1 'font-lock-func-face))
 'append) ;; <-- Add after all other rules

(require 'rainbow-delimiters)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)

(cl-loop for index from 1 to rainbow-delimiters-max-face-count
	 do
	 (let ((face
		(intern (format "rainbow-delimiters-depth-%d-face" index))))
	   (cl-callf color-saturate-name (face-foreground face) 30)))

(setq markdown-command "pandoc")

(latex-preview-pane-enable)
(require 'latex-pretty-symbols)

(require 'js-comint)
(setq inferior-js-program-command "/usr/bin/java org.mozilla.javascript.tools.shell.Main")
(add-hook 'js2-mode-hook '(lambda ()
			    (local-set-key "\C-x\C-e" 'js-send-last-sexp)
			    (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
			    (local-set-key "\C-cb" 'js-send-buffer)
			    (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
			    (local-set-key "\C-cl" 'js-load-file-and-go)
			    ))

;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "s-l")

(use-package lsp-mode
    :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
            (js2-mode . lsp))
    :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)

(require 'emmet-mode)
(setq web-mode-ac-sources-alist
  '(("css" . (ac-source-css-property))
    ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
(setq web-mode-content-types-alist
  '(("jsx" . "\\.js[x]?\\'")))
(add-hook 'web-mode-hook  'emmet-mode)
(setq web-mode-ac-sources-alist
  '(("php" . (ac-source-yasnippet ac-source-php-auto-yasnippets))
    ("html" . (ac-source-emmet-html-aliases ac-source-emmet-html-snippets))
    ("css" . (ac-source-css-property ac-source-emmet-css-snippets))))

(add-hook 'web-mode-before-auto-complete-hooks
    '(lambda ()
     (let ((web-mode-cur-language
  	    (web-mode-language-at-pos)))
	       (if (string= web-mode-cur-language "php")
    	   (yas-activate-extra-mode 'php-mode)
      	 (yas-deactivate-extra-mode 'php-mode))
	       (if (string= web-mode-cur-language "css")
    	   (setq emmet-use-css-transform t)
      	 (setq emmet-use-css-transform nil)))))
(setq emmet-expand-jsx-className? t)

(add-hook 'local-write-file-hooks
            (lambda ()
	       (delete-trailing-whitespace)
	       nil))

(defun my-setup-indent (n)
  ;; java/c/c++
  (setq-local c-basic-offset n)
  ;; web development
  ;; (setq-local coffee-tab-width n) ; coffeescript
  ;; (setq-local javascript-indent-level n) ; javascript-mode
  ;; (setq-local js-indent-level n) ; js-mode
  ;; (setq-local js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq-local web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq-local web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq-local web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq-local css-indent-offset n) ; css-mode
  )

(defun my-web-code-style ()
  (interactive)
  ;; use tab instead of space
  (setq-local indent-tabs-mode t)
  ;; indent 4 spaces width
  (my-setup-indent 4))

(add-hook 'web-mode-hook 'my-web-code-style)

(setq-default web-mode-comment-formats
	      '(("java"       . "/*")
		("javascript" . "//")
		("php"        . "/*")))

(require 'prettier-js)
(add-hook 'js2-mode-hook 'prettier-js-mode)
;; (add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'js-mode-hook 'prettier-js-mode)
(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
	  (funcall (cdr my-pair)))))
(add-hook 'web-mode-hook #'(lambda ()
			     (enable-minor-mode
			      '("\\.jsx?\\'" . prettier-js-mode))))
(setq prettier-js-args 
      '("--trailing-comma" "none"
	"--bracket-spacing" "true"
	"--single-quote" "true"
	"--jsx-single-quote" "true"
	"--jsx-bracket-same-line" "true"
	"--print-width" "80"
	"--use-tabs" "false"
	"--tab-width" "4"))

(setq ibuffer-saved-filter-groups
	'(("home"
	   ("emacs-config" (or (filename . ".emacs.d")
			       (filename . "emacs-config")
			       (filename . "djr-init")))
	   ("Org" (or (mode . org-mode)
		      (filename . "OrgMode")))
	   ("lisp" (or (filename . "*.lisp")
		       (filename . "*.lsp")
		       (filename . "*.el")
		       (filename . "*.asd")
		       (filename . "*.clm")
		       (mode . lisp-mode)))
	   ("Web Dev" (or (mode . html-mode)
			  (mode . web-mode)
			  (mode . js2-mode)
			  (mode . jsx-mode)))
	   ("CSS" (or (mode . css-mode)
		      (mode . scss-mode)
		      (filename . "*.css")
		      (filename . "*.scss")))
	   ("ERC" (mode . erc-mode))
	   ("Shells/Terminals/REPLs" (or (name . "\*eshell\*")
					 (name . "\*terminal\*")
					 (name . "\*slime-repl sbcl\*")
					 (name . "\*shell\*")))
	   ("Logs" (or (name . "\*Messages\*")
		       (name . "\*slime-events\*")
		       (name . "\*inferior-lisp\*")
		       (name . "\*lsp-log\*")
		       (name . "\*jsts-ls\*")
		       (name . "\*jsts-log\*")
		       (name . "\*jsts-ls::stderr\*")))
	   ("Help" (or (name . "\*Help\*")
		       (name . "\*Apropos\*")
		       (name . "\*Completions\*")
		       (name . "\*info\*")))
	   ("Misc" (or  (name . "untitled")
			(name . "\*scratch\*"))))))
  (add-hook 'ibuffer-mode-hook
	    '(lambda ()
	       (ibuffer-switch-to-saved-filter-groups "home")))
  (setq ibuffer-expert t)
  (setq ibuffer-show-empty-filter-groups nil)
  (add-hook 'ibuffer-mode-hook
	    '(lambda ()
	       (ibuffer-auto-mode 1)
	       (ibuffer-switch-to-saved-filter-groups "home")))
(setq dired-auto-revert-buffer t
      auto-revert-verbose nil)

(setq-default org-display-custom-times t)
(setq org-time-stamp-custom-formats '("<%e %B %Y>" . "<%a, %e %b %Y %H:%M>"))
(require 'ox)
(defun endless/filter-timestamp (trans back _comm)
  "Remove <> around time-stamps."
  (pcase back
    ((or `jekyll `html)
     (replace-regexp-in-string "&[lg]t;" "" trans))
    (`latex
     (replace-regexp-in-string "[<>]" "" trans))))
(add-to-list 'org-export-filter-timestamp-functions
	     #'endless/filter-timestamp)

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))

;; Reveal.js + Org mode
(require 'ox-reveal)
(setq Org-Reveal-root "file:///Users/danieljross/reveal.js")
(setq Org-Reveal-title-slide nil)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
