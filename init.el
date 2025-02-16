(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection '((output-pdf "PDF Tools")) t)
 '(custom-safe-themes
   '("2e7dc2838b7941ab9cabaa3b6793286e5134f583c04bde2fba2f4e20f2617cf7" "603a831e0f2e466480cdc633ba37a0b1ae3c3e9a4e90183833bc4def3421a961" default))
 '(fido-mode nil)
 '(fido-vertical-mode t)
 '(menu-bar-mode nil)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(cdlatex corfu orderless marginalia vertico trashed dired-subtree nerd-icons-dired nerd-icons-corfu nerd-icons-completion nerd-icons exec-path-from-shell pdf-tools auctex eat markdown-mode magit))
 '(pixel-scroll-mode t)
 '(pixel-scroll-precision-mode t)
 '(tab-always-indent 'complete)
 '(tool-bar-mode nil))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMonoNL Nerd Font Mono" :foundry "nil" :slant normal :weight regular :height 140 :width normal))))
 '(font-latex-script-char-face ((t (:foreground "light green")))))



;; ;;Custom settings done manually
;; ;;exec-path from shell
;; (when (eq system-type 'darwin)
;;   (setq exec-path-from-shell-arguments '("-l"))
;;   (exec-path-from-shell-initialize))

;; ;;something to do with long lines
;; (global-so-long-mode t)

;; ;;force utf-8 encoding
;; (prefer-coding-system       'utf-8)
;; (set-default-coding-systems 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (setq default-buffer-file-coding-system 'utf-8)
;; (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; ;;history related things
;; (savehist-mode 1)
;; (recentf-mode t)



;; (setq-default indent-tabs-mode nil)

;; (setq switch-to-buffer-obey-display-actions t)

;; ;;Highlight line on point
;; (add-hook 'prog-mode-hook #'hl-line-mode)
;; (add-hook 'text-mode-hook #'hl-line-mode)
;; (add-hook 'org-mode-hook #'hl-line-mode)

;; ;; turn on flymake by default
;; (add-hook 'prog-mode-hook #'flymake-mode)


;; ;; turn on flymake by default
;; (add-hook 'prog-mode-hook #'flyspell-prog-mode)

;; ;;get over with the nonsense autorevert stuff once and for all
;; (global-auto-revert-mode)

;; ;;want everything to be automatic


;; ;; no yes no excessive typing
;; (setq use-short-answers t)

;; ;; because we don't ever need to quit emacs
;; (setq confirm-kill-emacs 'yes-or-no-p)

;; ;;make dired nice
;; (use-package dired
;;   :hook (dired-mode . dired-hide-details-mode)
;;   :config
;;   (setq dired-listing-switches "-alFh")
;;   (setq dired-dwim-target t))

;;eglot
;; (use-package eglot
;;   :bind (("C-c l c" . eglot-reconnect)
;;          ("C-c l d" . flymake-show-buffer-diagnostics)
;;          ("C-c l f f" . eglot-format)
;;          ("C-c l f b" . eglot-format-buffer)
;;          ("C-c l l" . eglot)
;;          ("C-c l r n" . eglot-rename)
;;          ("C-c l s" . eglot-shutdown)
;;          ("C-c l i" . eglot-inlay-hints-mode)))

;; ;;flymake
;; (use-package flymake
;;   :bind (:map flymake-mode-map
;;          ("C-c n" . flymake-goto-next-error)
;;          ("C-c p" . flymake-goto-prev-error)))

;;company
;;(global-set-key (kbd "<tab>") #'company-indent-or-complete-common)
;; (global-company-mode)
;; (use-package company
;;   :config
;; ;;  (define-key company-mode-map (kbd "<tab>") #'company-complete)
;;   (setq company-minimum-prefix-length 1)
;;   (setq company-idle-delay 0)
;;   (setq company-selection-wrap-around t)
;;   (company-tng-configure-default))



;; (set-foreground-color "white")
;; (set-background-color "black")

;; (setq default-frame-alist
;;   '((foreground-color . "white")
;;     (background-color . "black")))

;; (with-eval-after-load 'eglot
;;   (add-to-list 'eglot-server-programs
;; 	       '(c++-mode . ("/opt/homebrew/Cellar/llvm/18.1.8/bin/clangd"))))

;; Copied from Prot's starting config. 

;; setq custom-file (locate-user-emacs-file "custom.el"))
;; (load custom-file :no-error-if-file-is-missing)

;;; Set up the package manager

(require 'package)
(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(when (< emacs-major-version 29)
  (unless (package-installed-p 'use-package)
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install 'use-package)))

(add-to-list 'display-buffer-alist
             '("\\`\\*\\(Warnings\\|Compile-Log\\)\\*\\'"
               (display-buffer-no-window)
               (allow-no-window . t)))

;;; Basic behaviour

(use-package delsel
  :ensure nil
  :hook (after-init . delete-selection-mode))

(defun prot/keyboard-quit-dwim ()
  "Do-What-I-Mean behaviour for a general `keyboard-quit'.

The generic `keyboard-quit' does not do the expected thing when
the minibuffer is open.  Whereas we want it to close the
minibuffer, even without explicitly focusing it.

The DWIM behaviour of this command is as follows:

- When the region is active, disable it.
- When a minibuffer is open, but not focused, close the minibuffer.
- When the Completions buffer is selected, close it.
- In every other case use the regular `keyboard-quit'."
  (interactive)
  (cond
   ((region-active-p)
    (keyboard-quit))
   ((derived-mode-p 'completion-list-mode)
    (delete-completion-window))
   ((> (minibuffer-depth) 0)
    (abort-recursive-edit))
   (t
    (keyboard-quit))))

(define-key global-map (kbd "C-g") #'prot/keyboard-quit-dwim)

;;; Tweak the looks of Emacs

;; Those three belong in the early-init.el, but I am putting them here
;; for convenience.  If the early-init.el exists in the same directory
;; as the init.el, then Emacs will read+evaluate it before moving to
;; the init.el.
;; (menu-bar-mode 1)
;; (scroll-bar-mode 1)
;; (tool-bar-mode -1)

(let ((mono-spaced-font "Monospace")
      (proportionately-spaced-font "Sans"))
  (set-face-attribute 'default nil :family mono-spaced-font :height 100)
  (set-face-attribute 'fixed-pitch nil :family mono-spaced-font :height 1.0)
  (set-face-attribute 'variable-pitch nil :family proportionately-spaced-font :height 1.0))

;; (use-package modus-themes
;;   :ensure t
;;   :config
;;   (load-theme 'modus-vivendi-tinted :no-confirm-loading))

(use-package ef-themes
  :ensure t
  :demand t
  :bind
  (("<f5>" . ef-themes-rotate)
   ("C-<f5>" . ef-themes-select))
  :config
  (setq ef-themes-headings ; read the manual's entry or the doc string
        '((0 variable-pitch light 1.9)
          (1 variable-pitch light 1.8)
          (2 variable-pitch regular 1.7)
          (3 variable-pitch regular 1.6)
          (4 variable-pitch regular 1.5)
          (5 variable-pitch 1.4) ; absence of weight means `bold'
          (6 variable-pitch 1.3)
          (7 variable-pitch 1.2)
          (t variable-pitch 1.1)))

  ;; They are nil by default...
  (setq ef-themes-mixed-fonts t
        ef-themes-variable-pitch-ui nil)

  ;; Disable all other themes to avoid awkward blending:
  (mapc #'disable-theme custom-enabled-themes)

  ;; Load the theme of choice:
  (load-theme 'ef-deuteranopia-dark :no-confirm))

;; Remember to do M-x and run `nerd-icons-install-fonts' to get the
;; font files.  Then restart Emacs to see the effect.
(use-package nerd-icons
  :ensure t)

(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

;;; Configure the minibuffer and completions

(use-package vertico
  :ensure t
  :hook (after-init . vertico-mode))

(use-package marginalia
  :ensure t
  :hook (after-init . marginalia-mode))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic))
  (setq completion-category-defaults nil)
  (setq completion-category-overrides nil))

(use-package savehist
  :ensure nil ; it is built-in
  :hook (after-init . savehist-mode))

(use-package corfu
  :ensure t
  :hook (after-init . global-corfu-mode)
  :bind (:map corfu-map ("<tab>" . corfu-complete))
  :config
  (setq tab-always-indent 'complete)
  (setq corfu-preview-current nil)
  (setq corfu-min-width 20)

  (setq corfu-popupinfo-delay '(1.25 . 0.5))
  (corfu-popupinfo-mode 1) ; shows documentation after `corfu-popupinfo-delay'

  ;; Sort by input history (no need to modify `corfu-sort-function').
  (with-eval-after-load 'savehist
    (corfu-history-mode 1)
    (add-to-list 'savehist-additional-variables 'corfu-history)))

;;; The file manager (Dired)

(use-package dired
  :ensure nil
  :commands (dired)
  :hook
  ((dired-mode . dired-hide-details-mode)
   (dired-mode . hl-line-mode))
  :config
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  (setq delete-by-moving-to-trash t)
  (setq dired-dwim-target t))

(use-package dired-subtree
  :ensure t
  :after dired
  :bind
  ( :map dired-mode-map
    ("<tab>" . dired-subtree-toggle)
    ("TAB" . dired-subtree-toggle)
    ("<backtab>" . dired-subtree-remove)
    ("S-TAB" . dired-subtree-remove))
  :config
  (setq dired-subtree-use-backgrounds nil))

(use-package trashed
  :ensure t
  :commands (trashed)
  :config
  (setq trashed-action-confirmer 'y-or-n-p)
  (setq trashed-use-header-line t)
  (setq trashed-sort-key '("Date deleted" . t))
  (setq trashed-date-format "%Y-%m-%d %H:%M:%S"))



;; Aftab's old config remaining bits.

;; always use electric indentation etc when possible.
(add-hook 'prog-mode-hook (lambda () (electric-pair-mode t)))
(add-hook 'prog-mode-hook (lambda () (show-paren-mode t)))

;;fill column to 80 characters.
(setq-default fill-column 80)

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `(c++-mode . ,(eglot-alternatives
                               '(("clangd")
                                 ("/opt/homebrew/Cellar/llvm/18.1.8/bin/clangd"))))))

;; set the default spelling program to aspell
(setq-default ispell-program-name "aspell")
(setq backup-directory-alist `(("." . "~/.emacs_backups_aftab")))

;; remove the bell
(setq ring-bell-function 'ignore)

;;AucTeX pdf-tools cooperation
;; to use pdfview with auctex
;;Note: there are still problems here that need to be fixed
(pdf-tools-install)
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))

(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
		      
