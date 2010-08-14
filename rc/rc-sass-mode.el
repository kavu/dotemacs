(require 'sass-mode)
(add-hook 'sass-mode-hook
          '(lambda () (add-hook 'local-write-file-hooks
                           '(lambda () (save-excursion (untabify (point-min) (point-max)))))))

(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))

(add-hook 'sass-mode-hook 'rainbow-mode)
