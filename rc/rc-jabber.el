(require 'jabber-autoloads)
(require 'notify)

(setq jabber-account-list
 '(("kavu13@gmail.com/emacs"
   (:network-server . "talk.google.com")
   (:connection-type . ssl))))

(defun libnotify-hook (from buffer text alert)
  (when (or jabber-message-alert-same-buffer
            (not (memq (selected-window) (get-buffer-window-list buffer))))
    (notify (if (jabber-muc-sender-p from)
                (jabber-jid-displayname (jabber-jid-user from))
              (jabber-jid-displayname from)) text)))

(add-hook 'jabber-alert-message-hooks 'libnotify-hook)

(setq fsm-debug nil)
