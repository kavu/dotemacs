(require 'flymake)
(setq flymake-log-level 3)

(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "~/.emacs.d/flymake/erlfly" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.erl\\'" flymake-erlang-init))

(defun my-erlang-mode-hook ()
  (flymake-mode 1))

(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)
