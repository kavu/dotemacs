;;; Yasnippet 
(require 'yasnippet)

(yas/initialize)

(setq yas/root-directory '("~/.emacs.d/snippets"
                           "~/.emacs.d/packages/yasnippet/snippets"
                           "~/.emacs.d/packages/emacs-rails-reloaded/snippets"
                           "~/.emacs.d/packages/cucumber.el/snippets"))
(mapc 'yas/load-directory yas/root-directory)
