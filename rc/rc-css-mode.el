(autoload 'css-mode "css-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(add-hook 'css-mode-hook 'rainbow-mode)
