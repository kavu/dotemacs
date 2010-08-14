(add-hook 'compilation-finish-functions (lambda (buffer result)
                                          (setq buffer-read-only nil)
                                          (ansi-color-apply-on-region (point-min) (point-max))
                                          (setq buffer-read-only t)))
