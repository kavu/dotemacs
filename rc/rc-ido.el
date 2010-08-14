;;; ido.el - http://www.emacswiki.org/emacs/InteractivelyDoThings
(require 'ido)
(ido-mode t)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10)

(add-hook 'ido-setup-hook (lambda ()
                            (define-key ido-completion-map (kbd "TAB") 'ido-next-match)))

