(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
;(load "erlang_appwiz" t nil)
(require 'erlang-start)

(add-hook 'erlang-mode-hook (lambda ()
                              (setq inferior-erlang-machine-options '("-sname" "emacs"))))

(setq erl-nodename-cache
      (make-symbol
       (concat "emacs@"
               (car (split-string (shell-command-to-string "hostname"))))))
