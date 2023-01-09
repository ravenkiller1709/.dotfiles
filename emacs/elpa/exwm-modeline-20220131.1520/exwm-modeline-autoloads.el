;;; exwm-modeline-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "exwm-modeline" "exwm-modeline.el" (0 0 0 0))
;;; Generated autoloads from exwm-modeline.el

(defvar exwm-modeline-mode nil "\
Non-nil if Exwm-Modeline mode is enabled.
See the `exwm-modeline-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `exwm-modeline-mode'.")

(custom-autoload 'exwm-modeline-mode "exwm-modeline" nil)

(autoload 'exwm-modeline-mode "exwm-modeline" "\
A mode for displaying EXWM workspaces in the modeline.

This is a minor mode.  If called interactively, toggle the
`Exwm-Modeline mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='exwm-modeline-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

Make sure to call this after EXWM was initialized, for instance
in `exwm-init-hook'.

By default, the mode displays all the workspaces on the current
monitor.  To display only the current workspace, enable
`exwm-modeline-short', and to disable the filtering by the
monitor, disable `exwm-modeline-randr'.

If `exwm-modeline-display-urgent' is set, the mode also displays
if the workspace has a window market as urgent.  However, this
option forces the modeline to update after every workspace
switch, so it may be wise to disable that in case of performance
issues.

Also, take a look at the `exwm-modeline' group for faces
customization.

This implementation intends to reduce the count of times of
evaluating the modestring; the rendered modestring is saved as a
frame parameter, and `exwm-modeline-segment' just returns it.

The update itself is done via the `exwm-modeline-update'
function.  You may need to run it manually after updating the
parameters, but other than that, this mode should cover all the
cases when the workspace list changes.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "exwm-modeline" '("exwm-modeline-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; exwm-modeline-autoloads.el ends here
