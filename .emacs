(setq inferior-lisp-program "/usr/bin/sbcl") ; your Lisp system
(add-to-list 'load-path "~/.emacs.d/packages/slime/")
(require 'slime)
(slime-setup)

(tool-bar-mode -1)
(menu-bar-mode -1)

(set-face-attribute 'default nil :font "Dejavu Sans Mono-10")

(add-to-list 'load-path "/home/kavu/.emacs.d/")

(add-to-list 'load-path "/home/kavu/.emacs.d/color-theme")
(require 'color-theme)
(color-theme-initialize)
(vivid-chalk)

(add-to-list 'load-path "/usr/lib/erlang/lib/tools-2.6.5.1/emacs")
(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
;(load "erlang_appwiz" t nil)
(require 'erlang-start)

(setq inferior-lisp-program "/usr/bin/sbcl") ; your Lisp system
(add-to-list 'load-path "~/.emacs.d/slime-1.2")  ; your SLIME directory
(require 'slime)
(slime-setup)

(add-to-list 'load-path "/home/kavu/.emacs.d/org-6.34c/lisp")
(add-to-list 'load-path "/home/kavu/.emacs.d/org-6.34c/contrib")
(add-to-list 'load-path "~/.emacs.d/packages/org/lisp")
(add-to-list 'load-path "~/.emacs.d/packages/org/contrib")
(require 'org-install)

(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))

(autoload 'magit-status "magit" nil t)

(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

(add-to-list 'load-path "~/.emacs.d/packages/distel/elisp")
(require 'distel)
(distel-setup)

(add-hook 'erlang-mode-hook
  (lambda ()
   ;; when starting an Erlang shell in Emacs, default in the node name
    (setq inferior-erlang-machine-options '("-sname" "emacs"))))
(setq erl-nodename-cache
  (make-symbol
    (concat
        "emacs@"
        (car (split-string (shell-command-to-string "hostname"))))))

(set-language-environment 'UTF-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'mule-utf-8)
(setq default-input-method 'russian-computer)


(show-paren-mode 1)
(delete-selection-mode t)

(add-hook 'c-mode-hook
  (lambda ()
    (define-key c-mode-map (kbd "C-c c") 'compile)))

(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)

(scroll-bar-mode -1)

;; Display time
(display-time)

;; Always end a file with a newline
(setq require-final-newline t)

;; use y or n instead of yes or not
(fset 'yes-or-no-p 'y-or-n-p)

(windmove-default-keybindings)

;disable backup and autosave
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq make-backup-files nil)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(add-to-list 'load-path  "~/.emacs.d/packages/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/packages/yasnippet/snippets")
;;; MaGit 
(add-to-list 'load-path  "~/.emacs.d/packages/magit")
(require 'magit)

(require 'haml-mode)
(add-hook 'haml-mode-hook 
  '(lambda () (add-hook 'local-write-file-hooks 
    '(lambda () (save-excursion (untabify (point-min) (point-max)))))))

(require 'sass-mode)
(add-hook 'sass-mode-hook 
  '(lambda () (add-hook 'local-write-file-hooks 
    '(lambda () (save-excursion (untabify (point-min) (point-max)))))))
(add-to-list 'load-path "~/.emacs.d/packages/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
	'(lambda ()
		(define-key yaml-mode-map (kbd "RET") 'newline-and-indent)))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(autoload 'css-mode "css-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))
