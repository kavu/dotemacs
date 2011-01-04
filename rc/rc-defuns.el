(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil '(("(?\\(lambda\\>\\)"
          (0 (progn
               (compose-region (match-beginning 1)
                               (match-end 1)
                               (make-char 'greek-iso8859-7 107))
               nil))))))

(defun window-system-config ()
  (set-face-attribute 'default nil :font "Droid Sans Mono-10")
  (add-hook 'slime-mode-hook 'pretty-lambdas)
  (add-hook 'emacs-lisp-mode-hook 'pretty-lambdas))

;;; FIXME/TODO/BUG/XXX highlight
(defun markers-hl ()
  (font-lock-add-keywords nil
                          '(("\\<\\(FIXME\\|TODO\\|BUG\\|XXX\\):" 1 font-lock-warning-face t))))

