(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil '(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1) (make-char 'greek-iso8859-7 107)) nil))))))

(setq inferior-lisp-program "/usr/bin/sbcl") ; your Lisp system
(add-to-list 'load-path "~/.emacs.d/packages/slime/")
(require 'slime)
(slime-setup)

(defun window-system-config()
   (set-face-attribute 'default nil :font "Dejavu Sans Mono-10")
   (add-hook 'slime-mode-hook 'pretty-lambdas)
   (add-hook 'emacs-lisp-mode-hook 'pretty-lambdas))

(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)

(setq frame-title-format '(buffer-file-name "%f" ("%b")))
(setq x-select-enable-clipboard t)

(if window-system 
  (window-system-config))

;(setq tab-width 1)
(setq-default indent-tabs-mode nil)

(add-to-list 'load-path "~/.emacs.d/")

(add-to-list 'load-path "~/.emacs.d/packages/color-theme")
(require 'color-theme)
(color-theme-initialize)
(vivid-chalk)
(setq color-theme-is-global t)

(add-to-list 'load-path "/usr/lib/erlang/lib/tools-2.6.5.1/emacs")
(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
;(load "erlang_appwiz" t nil)
(require 'erlang-start)
  
(add-to-list 'load-path "~/.emacs.d/packages/org/lisp")
(add-to-list 'load-path "~/.emacs.d/packages/org/contrib")
(require 'org-install)

(autoload 'magit-status "magit" nil t)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))

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

(add-to-list 'load-path "~/.emacs.d/packages/")

; (require 'jabber-autoloads)

;;; ido.el - http://www.emacswiki.org/emacs/InteractivelyDoThings
(require 'ido)
(ido-mode t)
(setq ido-enable-prefix nil
	ido-enable-flex-matching t
	ido-create-new-buffer 'always
	ido-use-filename-at-point 'guess
	ido-max-prospects 10)

(add-hook 'ido-setup-hook 'ido-my-keys)
(defun ido-my-keys ()
  "Add my keybindings for ido."
  (define-key ido-completion-map (kbd "TAB") 'ido-next-match))

(require 'buff-menu+)
(global-set-key (kbd "C-b") 'buffer-menu)

;;; Yasnippet 
(add-to-list 'load-path  "~/.emacs.d/packages/yasnippet")
(require 'yasnippet)
(yas/initialize)
(setq yas/root-directory '("~/.emacs.d/snippets"
                           "~/.emacs.d/packages/yasnippet/snippets"
                           "~/.emacs.d/packages/emacs-rails-reloaded/snippets"
                           "~/.emacs.d/packages/cucumber.el/snippets"))
(mapc 'yas/load-directory yas/root-directory)

;;; idle-highlight.el
(require 'idle-highlight)

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

(add-to-list 'load-path "~/.emacs.d/packages/ruby-complexity")
(require 'linum)
(require 'ruby-complexity)
(add-hook 'ruby-mode-hook
        (function (lambda ()
          (flymake-mode)
          (linum-mode)
          (ruby-complexity-mode))))

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-to-list 'load-path "~/.emacs.d/packages/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map (kbd "RET") 'newline-and-indent)))

(autoload 'css-mode "css-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))

(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))

(add-to-list 'load-path "~/.emacs.d/packages/ruby-mode")
(autoload 'ruby-mode "ruby-mode" "major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(require 'ruby-electric)

(add-to-list 'load-path "~/.emacs.d/packages/gist.el")
(require 'gist)

(autoload 'mode-compile "mode-compile"
    "Command to compile current buffer file based on the major mode" t)
;(global-set-key "\C-cc" 'mode-compile)

(autoload 'mode-compile-kill "mode-compile"
    "Command to kill a compilation launched by `mode-compile'" t)
;(global-set-key "\C-ck" 'mode-compile-kill)

(add-to-list 'load-path "~/.emacs.d/packages/rspec-mode")
(autoload 'rspec-mode "rspec-mode" " Minor mode for rSpec files" t)

(add-to-list 'load-path "~/.emacs.d/packages/emms/lisp")

(defun init-emms-setup() 
  (interactive)
  (if (boundp 'emms-version)
      () 
     (require 'emms-setup)
     (emms-all)
     (emms-default-players)))
(global-set-key [f12] 'init-emms-setup)

(add-to-list 'load-path "~/.emacs.d/packages/cucumber.el")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(autoload 'paredit-mode "paredit" "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))

(setq load-path (cons (expand-file-name "~/.emacs.d/packages/emacs-rails-reloaded") load-path))
(require 'rails-autoload)

(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))

(add-to-list 'load-path "~/.emacs.d/packages/rhtml-mode")
(require 'rhtml-mode)

(add-to-list 'load-path "~/.emacs.d/packages/zencoding")
(require 'zencoding-mode)
    (add-hook 'sgml-mode-hook 'zencoding-mode)
