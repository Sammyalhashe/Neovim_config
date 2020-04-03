;; prevent the startup message
(setq inhibit-startup-message t)

;; prevent the toolbar from showing up
(tool-bar-mode -1)
;; disable the menu and scroll bars
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; display line numbers (relative)
(display-line-numbers-mode t)
(setq display-line-numbers 'relative)

;; highlights the current line you are on
(global-hl-line-mode t)

;; show line numbers
(line-number-mode t)

;; set CMD to meta key
(setq mac-command-modifier 'meta)

;; ――――――――――――――――――――――――――――――――― Use better defaults ―――――――――――――――――――――――――――――――
(setq-default
 ;; Don't use the compiled code if its the older package.
 load-prefer-newer t

 ;; Do not show the startup message.
 inhibit-startup-message t

 ;; Do not put 'customize' config in init.el; give it another file.
 custom-file "~/.emacs.d/custom-file.el"

 ;; 72 is too less for the fontsize that I use.
 fill-column 90

 ;; Use your name in the frame title. :)
 frame-title-format (format "%s's Emacs" (capitalize user-login-name))

 ;; Do not create lockfiles.
 create-lockfiles nil

 ;; Don't use hard tabs
 indent-tabs-mode nil

 ;; Emacs can automatically create backup files. This tells Emacs to put all backups in
 ;; ~/.emacs.d/backups. More info:
 ;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
 backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))

 ;; Do not autosave.
 auto-save-default nil

 ;; Allow commands to be run on minibuffers.
 enable-recursive-minibuffers t)

;; Change all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Make the command key behave as 'meta'
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta))

;; `C-x o' is a 2 step key binding. `M-o' is much easier.
(global-set-key (kbd "M-o") 'other-window)

;; Delete whitespace just when a file is saved.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Enable narrowing commands.
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

;; Display column number in mode line.
(column-number-mode t)

;; Automatically update buffers if file content on the disk has changed.
(global-auto-revert-mode t)

;; ――――――――――――――――――――――――― Better interaction with X clipboard ―――――――――――――――――――――――――
(setq-default
 ;; Makes killing/yanking interact with the clipboard.
 x-select-enable-clipboard t

 ;; To understand why this is done, read `X11 Copy & Paste to/from Emacs' section here:
 ;; https://www.emacswiki.org/emacs/CopyAndPaste.
 x-select-enable-primary t

 ;; Save clipboard strings into kill ring before replacing them. When
 ;; one selects something in another program to paste it into Emacs, but
 ;; kills something in Emacs before actually pasting it, this selection
 ;; is gone unless this variable is non-nil.
 save-interprogram-paste-before-kill t

 ;; Shows all options when running apropos. For more info,
 ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html.
 apropos-do-all t

 ;; Mouse yank commands yank at point instead of at click.
 mouse-yank-at-point t)


;; ----------------------- Packages ----------------------------------------------------

(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)
(package-refresh-contents)

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.emacs.d/elpa")
  (require 'use-package))

;; load my path
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; evil leader
(require 'evil-leader)
(global-evil-leader-mode)

;; Enable Evil
(use-package evil
  :config
  (evil-mode 1))


;; lsp-mode
(use-package lsp-mode
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (python-mode . lsp))
  :commands lsp)

;; company-lsp
(use-package company-lsp :ensure t
  :after (lsp-mode company)
  :defer t
  :config
  (progn
    (setq company-lsp-async t)))

;; lsp-java
(use-package lsp-java :ensure t :after lsp-mode
  :hook ((java-mode . lsp-mode)
         (java-mode . (lambda () (add-to-list (make-local-variable 'company-backends) 'company-lsp)))))

;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "s-l")

;; load my colorscheme
(load-theme 'atom-one-dark t)

;; helm config
(require 'helm-config)

;; helm projectile
(require 'helm-projectile)
(helm-projectile-on)

;; doom modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package smartparens
  :ensure t
  :config
  (setq sp-show-pair-from-inside nil)
  (require 'smartparens-config)
  :diminish smartparens-mode
  :init
  (add-hook 'python-mode-hook #'smartparens-strict-mode)
  (add-hook 'java-mode-hook #'smartparens-strict-mode))


;; my standard selections --------------------------------------------------------------
(set-face-attribute 'default nil
                    :family "OperatorMonoLig Nerd Font" :height 145 :weight 'normal)

;; windmove for easy movement between windows (splits in vim)
(windmove-default-keybindings 'control)
(global-set-key (kbd "C-h")  'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "C-k")    'windmove-up)
(global-set-key (kbd "C-j")  'windmove-down)

;; lsp mode
(setq lsp-signature-auto-activate nil)
;; for python
(setq lsp-python-executable-cmd "python3")
(setq python-shell-interpreter "python3")


;; function to reload init.el
(defun reload-init-file ()
  (interactive)
  (load-file user-init-file))

;; evil-leader
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "e" 'helm-M-x
  "f f" 'helm-find-files
  "p f" 'helm-projectile-find-files
  "p p" 'helm-projectile-switch-project
  "f e d" 'reload-init-file
  "b" 'switch-to-buffer
  "o t" 'treemacs
  "k" 'kill-buffer)

;; helm-config
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x r b") 'helm-bookmarks)
(global-set-key (kbd "C-x x") 'helm-M-x)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-j") 'helm-next-line)
(define-key helm-map (kbd "C-k") 'helm-previous-line)
(define-key helm-find-files-map (kbd "<Backspace>") 'helm-find-files-up-one-level)
(define-key helm-map (kbd "C-z") 'helm-select-action)

;; projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)


;; Programming mode configs -----------------------------------------------------------
(add-hook 'java-mode-hook (lambda ()
        (setq c-basic-offset 4
                tab-width 4
                indent-tabs-mode t)))
