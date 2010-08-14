(require 'haml-mode)
(add-hook 'haml-mode-hook
          '(lambda () (add-hook 'local-write-file-hooks 
                           '(lambda () (save-excursion (untabify (point-min) (point-max)))))))
