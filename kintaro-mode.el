;;; kintaro-mode.el --- major mode for editing Kintaro schema. -*- coding: utf-8; lexical-binding: t; -*-

;; Copyright © 2021 Daniel Ross

;; Author: Daniel Ross ( mr.danielross@gmail.com )
;; Version: 1.0.0
;; Created:14 March 2021
;; Keywords: Kintaro, Google, Schema
;; Homepage: https://danieljamesross.github.io/

;; This file is not part of GNU Emacs.

;;; License:

;; You can redistribute this program and/or modify it under the terms of the GNU General Public License version 2.

;;; kintaro-mode.el
;; Major mode for syntax highlighting Google Kintaro schema

;;; Commentary:
;;
;; Based on `How to Write a Emacs Major Mode for Syntax Coloring' by Xah Lee
;; http://ergoemacs.org/emacs/elisp_syntax_coloring.html
;;
;; Thank you, Xah!

;;; Code:

(defvar kintaro-mode-syntax-table nil "Syntax table for `kintaro-mode'.")

(setq kintaro-mode-syntax-table
      (let ( (synTable (make-syntax-table)))
        ;; python style comment: “# …”
        (modify-syntax-entry ?# "<" synTable)
        (modify-syntax-entry ?\n ">" synTable)
        synTable))


(setq kintaro-highlights
      '(("\* [^\-]*" . font-lock-function-name-face)
        ("\$[^\=]*" . font-lock-constant-face)
        (".+\:" . font-lock-type-face)))

;;;###autoload

(define-derived-mode kintaro-mode fundamental-mode "kintaro"
  "major mode for editing kintaro schema files."
  (setq font-lock-defaults '(kintaro-highlights))
  (set-syntax-table kintaro-mode-syntax-table))

;; add the mode to the `features' list
(provide 'kintaro-mode)

;;; kintaro-mode.el ends here
