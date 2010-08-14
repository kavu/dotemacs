(autoload 'ruby-mode "ruby-mode" "major mode for ruby files" t)

(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(require 'ruby-electric)

(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode" t)
(add-hook 'ruby-mode-hook (lambda () (inf-ruby-keys)))

(add-hook 'ruby-mode-hook (lambda () (autopair-mode)))

(add-hook 'ruby-mode-hook (lambda ()
                            (outline-minor-mode)
                            (setq outline-regexp " *\\(def \\|class\\|module\\)")))
