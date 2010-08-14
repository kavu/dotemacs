;(defun run-regex-tool ()
;  (interactive)
;  (require 'regex-tool)
;  (regex-tool))

(require 'regex-tool)
(global-set-key (kbd "<f2> r") 'regex-tool) 
