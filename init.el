(require 'cl)
; (defvar *emacs-load-start* (current-time))

;; load paths

(load "~/.emacs.d/rc/rc-load-paths.el")

;; general Emacs

(load "rc-defuns")
(load "rc-general.el")

;; modes

(load "rc-color-theme.el")

(load "rc-compilation-mode.el")
(load "rc-mode-compile.el")
(load "rc-whitespace-mode.el")
(load "rc-autopair-mode.el")
(load "rc-regex-tool.el")
(load "rc-idle-highlight.el")
(load "rc-pabbrev-mode.el")

(load "rc-magit.el")
(load "rc-gist.el")

(load "rc-yasnippet.el")

(load "rc-slime.el")
(load "rc-paredit.el")
(load "rc-clojure.el")

(load "rc-erlang-mode.el")
(load "rc-distel.el")

(load "rc-obj-j-mode.el")

(load "rc-lua-mode.el")
(load "rc-pkgbuild-mode.el")
(load "rc-haskell-mode.el")
(load "rc-sinasi.el")

(load "rc-php-mode.el")

(load "rc-ruby-mode.el")
(load "rc-haml-mode.el")
(load "rc-sass-mode.el")
(load "rc-ruby-complexity.el")
(load "rc-rspec-mode.el")
(load "rc-cucumber.el")
(load "rc-yaml-mode.el")
(load "rc-rails.el")
(load "rc-rhtml-mode.el")
(load "rc-rvm.el")
(load "rc-rdebug.el")

(load "rc-rainbow-mode.el")
(load "rc-moz.el")
;(load "rc-js2-mode.el")
(load "rc-espresso.el")
(load "rc-css-mode.el")
(load "rc-zencoding-mode.el")

(load "rc-flymake.el")
(load "rc-ido.el")
(load "rc-buff-menu.el")
(load "rc-speedbar.el")

(load "rc-org-mode.el")
(load "rc-google-maps.el")
(load "rc-google-weather.el")
(load "rc-auctex-mode.el")

(load "rc-emms.el")
(load "rc-erc.el")
(load "rc-jabber.el")

(setq custom-file "~/.emacs.d/rc/rc-custom.el")
(load custom-file)

;(message "My .emacs loaded in %ds"
;         (destructuring-bind (hi lo ms) (current-time)
;           (- (+ hi lo)
;              (+ (first *emacs-load-start*)
;                 (second *emacs-load-start*)))))

