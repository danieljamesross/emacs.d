(require 'cmake-font-lock)

;; Thanks Xah
;; http://xahlee.info/emacs/emacs/elisp_comment_coloring.html
(defun my-do-syntax-table ()
  "Set local syntax table, and re-color buffer."
  (interactive)
  (let ((synTable (make-syntax-table)))
    ;; python style comment: #...
    (modify-syntax-entry ?# "<" synTable)
    (modify-syntax-entry ?\n ">" synTable)
    (set-syntax-table synTable)
    (font-lock-default-fontify-syntactically (point-min) (point-max))))

;;;###autoload
(define-derived-mode djr-cmake-mode fundamental-mode "djr-cmake-mode"
  "Major mode for CMake files"

  ;; (set-face-foreground 'font-lock-comment-face "light pink")
  (cmake-font-lock-activate)
  (setq-local comment-start "#"))

(provide 'djr-cmake-mode)

;;; djr-cmake-mode.el ends here

; (add-to-list 'load-path (expand-file-name (concat user-emacs-directory "djr-cmake-mode/")))
; (require 'djr-cmake-mode)
; (add-to-list 'auto-mode-alist '("\[Cc][Mm]ake[Ll]ists\.txt\\'" . djr-cmake-mode))
