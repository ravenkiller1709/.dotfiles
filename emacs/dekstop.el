(setq exwm-workspace-index-map

(lambda (index)

(let ((named-workspaces ["1" "2" "3" "4" "5" "6" "7" "8" "9" "0"]))

(if (< index (length named-workspaces))

(elt named-workspaces index)

(number-to-string index)))))



(defun exwm-workspace--update-ewmh-desktop-names ()

(xcb:+request exwm--connection

(make-instance 'xcb:ewmh:set-_NET_DESKTOP_NAMES
	       :window exwm--root :dat;;;;a
	       (mapconcat (lambda (i) (funcall exwm-workspace-index-map)
			  (number-sequence 0 (1- (exwm-workspace--count)))

			  "\0"))))



(add-hook 'exwm-workspace-list-change-hook
	  #'exwm-workspace--update-ewmh-desktop-names)

;; you may need to call the function once manually
(exwm-workspace--update-ewmh-desktop-names)

(defun efs/disable-desktop-notifications ()
  (interactive)
  (start-process-shell-command "notify-send" nil "notify-send \"DUNST_COMMAND_PAUSE\""))

(defun efs/enable-desktop-notifications ()
  (interactive)
  (start-process-shell-command "notify-send" nil "notify-send \"DUNST_COMMAND_RESUME\""))

(defun efs/toggle-desktop-notifications ()
  (interactive)
  (start-process-shell-command "notify-send" nil "notify-send \"DUNST_COMMAND_TOGGLE\""))
