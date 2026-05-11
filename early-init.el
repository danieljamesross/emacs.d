;;; -*- lexical-binding: t; -*-

;; Boost the GC threshold during startup; emacs-startup-hook lowers it back.
(setq gc-cons-threshold (* 100 1024 1024)
      gc-cons-percentage 0.6)

;; Skip the cost of running file-name-handler-alist (tramp, jka-compr, ...)
;; for every load during init; restore it once Emacs is up.
(defvar djr/file-name-handler-alist--original file-name-handler-alist)
(setq file-name-handler-alist nil)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq file-name-handler-alist djr/file-name-handler-alist--original
                  gc-cons-threshold (* 2 1024 1024)
                  gc-cons-percentage 0.1)))

;; Silence native-comp's noisy warning buffer.
(setq native-comp-async-report-warnings-errors 'silent)

;; Let Emacs activate packages between early-init and init (the default).
(setq package-enable-at-startup t)

;; Suppress cl-functions byte-compile warnings (legacy cl loaded by deps).
(setq byte-compile-warnings '(cl-functions))

;; Frame chrome before the first frame is drawn.
(tool-bar-mode -1)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; Match the doom-monokai-pro background so the initial frame doesn't flash white.
(add-to-list 'default-frame-alist '(background-color . "#2D2A2E"))
(add-to-list 'default-frame-alist '(foreground-color . "#FCFCFA"))
