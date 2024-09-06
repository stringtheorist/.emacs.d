(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fido-vertical-mode t)
 '(menu-bar-mode nil)
 '(package-archive-priorities '(("gnu" . 100) ("nongnu" . 50) ("melpa" . 0)))
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages '(auctex eat markdown-mode magit))
 '(pixel-scroll-mode t)
 '(pixel-scroll-precision-mode t)
 '(tool-bar-mode nil)
 '(use-package-always-pin 'nongnu))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "IntoneMono Nerd Font Mono" :foundry "nil" :slant normal :weight regular :height 140 :width normal))))
 '(font-latex-script-char-face ((t (:foreground "light green")))))

;;Custom settings done manually


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

