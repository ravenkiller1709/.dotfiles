;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Clean up Emacs interface
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Make frame transparency overridable
(defvar efs/frame-transparency '(90 . 90))


(setq inhibit-startup-message t)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(menu-bar-mode -1)

(set-fringe-mode 10)

;; Set the default font
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 180
                    :weight 'normal
                    :width 'normal)


;;Toggle fullscreen
 '(initial-frame-alist '((fullscreen . maximized)))

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

  ;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; Let's get encrypted
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setenv "GPG_AGENT_INFO" nil)  ;; use emacs pinentry
    (setq auth-source-debug t)

    (setq epg-gpg-program "gpg2")  ;; not necessary
    (require 'epa-file)
    (epa-file-enable)
    (setq epa-pinentry-mode 'loopback)
    (setq epg-pinentry-mode 'loopback)

    (require 'org-crypt)
    (org-crypt-use-before-save-magic)

(defun efs/lookup-password (&rest keys)
  (let ((result (apply #'auth-source-search keys)))
    (if result
	(funcall (plist-get (car result) :secret))
      nil)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; EVIL MODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(use-package evil
  :ensure t
  :init ;; tweak evil's configuration before loading it
  (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-shift-round nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  :config ;; tweak evil after loading it
  (evil-mode))

;;(use-package evil-collection
;;  :after evil
;;  :ensure t
;;  :config
;;  (evil-collection-init))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; Magit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package magit
  :ensure t)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; DOOM THEMES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t))

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme
(doom-themes-neotree-config)  ; all-the-icons fonts must be installed!


(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 35)
	   (doom-modeline-bar-width 10)
	   (doom-modeline-buffer-file-name-style 'auto)
	   (doom-modeline-icon (display-graphic-p))
	   (doom-modeline-major-mode-icon t)
	   (doom-modeline-major-mode-color-icon t)
	   (doom-modeline-enable-word-count t)
	   (doom-modeline-modal-icon t)
	   (doom-modeline-mu4e nil)
	   (mu4e-alert-enable-mode-line-display)))



(display-battery-mode 1)

(display-time-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; Vertico
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Enable vertico
(use-package vertico
  :ensure t
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  (setq vertico-cycle t)
  )

;; Optionally use the `orderless' completion style. See
;; `+orderless-dispatch' in the Consult wiki for an advanced Orderless style
;; dispatcher. Additionally enable `partial-completion' for file path
;; expansion. `partial-completion' is important for wildcard support.
;; Multiple files can be opened at once with `find-file' if you enter a
;; wildcard. You may also give the `initials' completion style a try.
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; Alternatively try `consult-completing-read-multiple'.
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

(use-package hydra
  :defer t)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; ORG MODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun efs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

  (setq org-ellipsis " ▾")

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;; mu4e email configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun brighter ()
  (interactive)
  (start-process-shell-command "xbacklight + 10" nil "xbacklight + 10"))
(exwm-input-set-key (kbd "<XF86MonBrightnessUp>") 'brighter)

(defun dimmer ()
  (interactive)
  (start-process-shell-command "xbacklight - 10" nil "xbacklight - 10"))
(exwm-input-set-key (kbd "<XF86MonBrightnessDown>") 'dimmer)

(defun louder ()
  (interactive)
  (start-process-shell-command "amixer set Master 5%+" nil "amixer set Master 5%+"))
(exwm-input-set-key (kbd "<XF86AudioRaiseVolume>") 'louder)

(defun lower ()
  (interactive)
  (start-process-shell-command "amixer set Master 5%-" nil "amixer set Master 5%-"))
(exwm-input-set-key (kbd "<XF86AudioLowerVolume>") 'lower)

(defun mute ()
  (interactive)
  (start-process-shell-command "amixer set Master toggle" nil "amixer set Master toggle"))
(exwm-input-set-key (kbd "<XF86AudioMute>") 'mute)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;; mu4e email configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package mu4e
  :ensure nil
  :config

  ;;this is set to 't' to avoid mail syncing issues when using mbsync
  (setq mu4e-change-filenames-when-moving t)

  ;; refresh mail using isync every 10 minutes
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-maildir "~/Mail")

  ;; Configure the function to use for sending mail
(setq message-send-mail-function 'smtpmail-send-it)

  (setq mu4e-contexts
        (list
         ;; Work account
         (make-mu4e-context
          :name "Work"
          :match-func
            (lambda (msg)
              (when msg
                (string-prefix-p "/Gmail" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address . "mail4kruse@gmail.com")
                  (user-full-name    . "Kim Kruse")
		  (smtpmail-smtp-server  . "smtp.gmail.com")
                  (smtpmail-smtp-service . 465)
                  (smtpmail-stream-type  . ssl)
                  (mu4e-drafts-folder  . "/Gmail/Drafts")
                  (mu4e-sent-folder  . "/Gmail/Sent Mail")
                  (mu4e-refile-folder  . "/Gmail/[Gmail]/Alle mails")
                  (mu4e-trash-folder  . "/Gmail/[Gmail]/Trash")))

         ;; Personal account
         (make-mu4e-context
          :name "Personal"
          :match-func
            (lambda (msg)
              (when msg
                (string-prefix-p "/kimkruse" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address . "kim@kimkruse.xyz")
                  (user-full-name    . "Kim Kruse")
		  (smtpmail-smtp-server . "mail.kimkruse.xyz")
		  (smtpmail-smtp-service . 587)
		  (smtpmail-stream-type . starttls)
                  (mu4e-drafts-folder  . "/kimkruse/Drafts")
                  (mu4e-sent-folder  . "/kimkruse/Sent")
                  (mu4e-refile-folder  . "/kimkruse/Archive")
                  (mu4e-trash-folder  . "/kimkruse/Trash")))))

  (setq mu4e-maildir-shortcuts
      '(("/kimkruse/Inbox"             . ?i)
        ("/kimkruse/Sent" . ?s)
        ("/kimkruse/Drafts"    . ?d)
        ("/Gmail/Inbox"     . ?t))))

