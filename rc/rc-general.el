

(if window-system
    (window-system-config))

(tool-bar-mode -1)
;;(menu-bar-mode -1)
(tooltip-mode -1)
(show-paren-mode 1)
(delete-selection-mode t)
(scroll-bar-mode -1)

;; Display time
(setq display-time-24hr-format t)
(display-time)

(display-battery-mode 1)

(setq load-average t)

;; Always end a file with a newline
(setq require-final-newline t)

;; use y or n instead of yes or not
(fset 'yes-or-no-p 'y-or-n-p)

(windmove-default-keybindings)

;disable backup and autosave
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq make-backup-files nil)

(setq frame-title-format '(buffer-file-name "%f" ("%b")))
(setq x-select-enable-clipboard t)
(setq-default indent-tabs-mode nil)

(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)

(set-language-environment 'UTF-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'mule-utf-8)
(setq default-input-method 'russian-computer)
