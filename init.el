(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection '((output-pdf "PDF Tools")))
 '(custom-safe-themes
   '("603a831e0f2e466480cdc633ba37a0b1ae3c3e9a4e90183833bc4def3421a961" default))
 '(fido-vertical-mode t)
 '(menu-bar-mode nil)
 '(package-archive-priorities '(("gnu" . 100) ("nongnu" . 50) ("melpa" . 0)))
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
 '(package-selected-packages
   '(exec-path-from-shell pdf-tools dracula-theme julia-mode auctex eat markdown-mode magit))
 '(pixel-scroll-mode t)
 '(pixel-scroll-precision-mode t)
 '(tab-always-indent 'complete)
 '(tool-bar-mode nil)
 '(use-package-always-pin 'nongnu))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMonoNL Nerd Font Mono" :foundry "nil" :slant normal :weight regular :height 140 :width normal))))
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
