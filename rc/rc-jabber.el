(require 'jabber-autoloads)
(require 'notify)

(setq jabber-account-list
 '(("kavu13@gmail.com/emacs"
   (:network-server . "talk.google.com")
   (:connection-type . ssl))))

;; (defun awesome-notify (text title)
;;   (condition-case e
;;       (let ((process-connection-type))
;;         (shell-command-to-string (format "echo 'naughty.notify({text = \"%s\", title = \"%s\" %s})' | awesome-client -"
;;                                          text title jabber-awesome-args)))
;;     (error nil)))

(defun libnotify-hook (from buffer text alert)
  (when (or jabber-message-alert-same-buffer
            (not (memq (selected-window) (get-buffer-window-list buffer))))
    (notify (if (jabber-muc-sender-p from)
                (jabber-jid-displayname (jabber-jid-user from))
              (jabber-jid-displayname from)) text)))

(add-hook 'jabber-alert-message-hooks 'libnotify-hook)

(setq fsm-debug nil)
