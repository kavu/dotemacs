; (defvar *emacs-load-start* (current-time))

(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil '(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1) (make-char 'greek-iso8859-7 107)) nil))))))

(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "~/.emacs.d/packages/slime/")
(require 'slime)
(slime-setup)

(defun window-system-config()
   (set-face-attribute 'default nil :font "Droid Sans Mono-10")
   (add-hook 'slime-mode-hook 'pretty-lambdas)
   (add-hook 'emacs-lisp-mode-hook 'pretty-lambdas))

(tool-bar-mode -1)
;;(menu-bar-mode -1)
(tooltip-mode -1)

(setq frame-title-format '(buffer-file-name "%f" ("%b")))
(setq x-select-enable-clipboard t)

(add-hook 'compilation-finish-functions (lambda (buffer result)
                                          (setq buffer-read-only nil)
                                          (ansi-color-apply-on-region (point-min) (point-max))
                                          (setq buffer-read-only t)))

(if window-system
    (window-system-config))

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
       (concat "emacs@"
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
(setq display-time-24hr-format t)
(display-time)
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

(add-to-list 'load-path "~/.emacs.d/packages/")

; (require 'jabber-autoloads)

(setq-default indent-tabs-mode nil)

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

(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))


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
(autoload 'rspec-mode "rspec-mode" "Minor mode for rSpec files" t)

(add-to-list 'load-path "~/.emacs.d/packages/emms/lisp")

(defun init-emms ()
  (interactive)
  (require 'emms-setup)
  (require 'emms-player-mpd)
  (emms-devel)

  (setq emms-player-mpd-music-directory "/home/kavu/Music")
  ;(setq emms-player-mpd-server-name "localhost")
  ;(setq emms-player-mpd-server-port "6600")
  (emms-player-mpd-connect)
  
  (add-to-list 'emms-info-functions 'emms-info-mpd)
  (add-to-list 'emms-player-list 'emms-player-mpd)
  
  (global-set-key (kbd "<XF86AudioPlay>") 'emms-pause)
  (global-set-key (kbd "<XF86AudioStop>") 'emms-stop)
  (global-set-key (kbd "<XF86AudioPrev>") 'emms-previous)
  (global-set-key (kbd "<XF86AudioNext>") 'emms-next)
  
  ;(add-hook 'emms-player-started-hook 'emms-show)
  (setq emms-track-description-function
        (lambda (track)
          (let ((artist (emms-track-get track 'info-artist))
                (album  (emms-track-get track 'info-album))
                (number (emms-track-get track 'info-tracknumber))
                (title  (emms-track-get track 'info-title)))
            (if (and artist album title)
                (if number
                    (format "%s - %s" artist title)
                  (format "%s: %s - %s" artist title))
              (emms-track-simple-description track))))))

(defun init-emms-setup() 
  (interactive)
  (if (boundp 'emms-version)
      (emms)
    (init-emms)))

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

(require 'autopair)
(add-hook 'ruby-mode-hook 
	  '(lambda () (autopair-mode)))

(add-to-list 'load-path "~/.emacs.d/packages/regex-tool")
(defun run-regex-tool ()
  (interactive)
  (require 'regex-tool)
  (regex-tool))
(global-set-key (kbd "<f2> r") 'run-regex-tool) 

(add-hook 'ruby-mode-hook
          '(lambda ()
             (outline-minor-mode)
             (setq outline-regexp " *\\(def \\|class\\|module\\)")))

(require 'rvm)
(rvm-use-default)

(require 'sr-speedbar)
(global-set-key (kbd "<f2> d") 'sr-speedbar-toggle) 
(speedbar-add-supported-extension ".lisp")

(add-to-list 'load-path "~/.emacs.d/packages/jd-el")
(require 'google-maps)
(require 'org-location-google-maps)

(require 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'sass-mode-hook 'rainbow-mode)

(add-to-list 'load-path "~/.emacs.d/packages/haskell-mode")
(load "haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(setq haskell-font-lock-symbols t)

(setq whitespace-line-column 80)
(setq whitespace-style '(lines-tail))
(setq whitespace-mode 1)

(add-to-list 'load-path "~/.emacs.d/packages/rdebug")
(require 'rdebug)


(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT"))
(setq erc-autojoin-channels-alist '((".*" "#github" "#ruby-lang" "#archlinux" "##russian" "#RubyOnRails" "#git" "#emacs")))

(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

;(message "My .emacs loaded in %ds"
;         (destructuring-bind (hi lo ms) (current-time)
;           (- (+ hi lo)
;              (+ (first *emacs-load-start*)
;                 (second *emacs-load-start*)))))

