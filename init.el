(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection '((output-pdf "PDF Tools")) t)
 '(custom-safe-themes
   '("2e7dc2838b7941ab9cabaa3b6793286e5134f583c04bde2fba2f4e20f2617cf7" "603a831e0f2e466480cdc633ba37a0b1ae3c3e9a4e90183833bc4def3421a961" default))
 '(fido-vertical-mode t)
 '(menu-bar-mode nil)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(modus-themes yasnippet-snippets company company-auctex company-bibtex company-reftex exec-path-from-shell pdf-tools dracula-theme julia-mode auctex eat markdown-mode magit))
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



;;Custom settings done manually
;;exec-path from shell
(when (eq system-type 'darwin)
  (setq exec-path-from-shell-arguments '("-l"))
  (exec-path-from-shell-initialize))

;;something to do with long lines
(global-so-long-mode t)

;;force utf-8 encoding
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;;history related things
(savehist-mode 1)
(recentf-mode t)

(setq-default fill-column 80)

(setq-default indent-tabs-mode nil)

(setq switch-to-buffer-obey-display-actions t)

;;Highlight line on point
(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'text-mode-hook #'hl-line-mode)
(add-hook 'org-mode-hook #'hl-line-mode)

;; turn on flymake by default
(add-hook 'prog-mode-hook #'flymake-mode)


;; turn on flymake by default
(add-hook 'prog-mode-hook #'flyspell-prog-mode)

;;get over with the nonsense autorevert stuff once and for all
(global-auto-revert-mode)

;;want everything to be automatic
(add-hook 'prog-mode-hook (lambda () (electric-pair-mode t)))
(add-hook 'prog-mode-hook (lambda () (show-paren-mode t)))

;; no yes no excessive typing
(setq use-short-answers t)

;; because we don't ever need to quit emacs
(setq confirm-kill-emacs 'yes-or-no-p)

;;make dired nice
(use-package dired
  :hook (dired-mode . dired-hide-details-mode)
  :config
  (setq dired-listing-switches "-alFh")
  (setq dired-dwim-target t))

;;eglot
(use-package eglot
  :bind (("C-c l c" . eglot-reconnect)
         ("C-c l d" . flymake-show-buffer-diagnostics)
         ("C-c l f f" . eglot-format)
         ("C-c l f b" . eglot-format-buffer)
         ("C-c l l" . eglot)
         ("C-c l r n" . eglot-rename)
         ("C-c l s" . eglot-shutdown)
         ("C-c l i" . eglot-inlay-hints-mode)))

;;flymake
(use-package flymake
  :bind (:map flymake-mode-map
         ("C-c n" . flymake-goto-next-error)
         ("C-c p" . flymake-goto-prev-error)))

;;company
;;(global-set-key (kbd "<tab>") #'company-indent-or-complete-common)
(global-company-mode)
(use-package company
  :config
;;  (define-key company-mode-map (kbd "<tab>") #'company-complete)
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0)
  (setq company-selection-wrap-around t)
  (company-tng-configure-default))



;; (set-foreground-color "white")
;; (set-background-color "black")

(setq default-frame-alist
  '((foreground-color . "white")
    (background-color . "black")))

;; (with-eval-after-load 'eglot
;;   (add-to-list 'eglot-server-programs
;; 	       '(c++-mode . ("/opt/homebrew/Cellar/llvm/18.1.8/bin/clangd"))))
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

;;Theme
(add-hook 'after-init-hook (lambda () (load-theme 'modus-vivendi)))



;;AucTeX pdf-tools cooperation
;; to use pdfview with auctex
(pdf-tools-install)
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))
      ;;TeX-source-correlate-start-server t) ;; not sure if last line is neccessary

(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
		      
;;       TeX-source-correlate-start-server t) ;; not sure if last line is neccessary

;;  ;; to have the buffer refresh after compilation
;; (add-hook 'TeX-after-compilation-finished-functions
;;            #'TeX-revert-document-buffer)
;; to use pdfview with auctex

 ;; ;; to have the buffer refresh after compilation
 ;; (add-hook 'TeX-after-compilation-finished-functions
 ;;        #'TeX-revert-document-buffer)
