(package-initialize)

(require 'evil)
(evil-mode 1)

(define-key global-map (kbd "\C-h") 'delete-backward-char)
(define-key key-translation-map (kbd "\C-h") (kbd "<DEL>"))
(define-key evil-insert-state-map (kbd "\C-p") 'previous-line)
(define-key evil-insert-state-map (kbd "\C-n") 'next-line)
(define-key evil-insert-state-map (kbd "\C-f") 'forward-char)
(define-key evil-insert-state-map (kbd "\C-b") 'backward-char)
(define-key evil-insert-state-map (kbd "\C-k") 'kill-whole-line)
(define-key evil-insert-state-map (kbd "\C-a") 'back-to-indentation)
(define-key evil-insert-state-map (kbd "\C-e") 'end-of-line)
(defun evil-escape-or-quit (&optional prompt)
  (interactive)
  (cond
   ((or (evil-normal-state-p) (evil-insert-state-p)
        (evil-replace-state-p) (evil-visual-state-p)) [escape])
   (t (kbd "C-g"))))
(define-key key-translation-map (kbd "C-c") #'evil-escape-or-quit)
(define-key evil-operator-state-map (kbd "C-c") #'evil-escape-or-quit)
(define-key evil-normal-state-map [escape] #'keyboard-quit)

(load-theme 'misterioso t)
(setq ring-bell-function 'ignore)
(setq make-backup-files nil)
(setq auto-save-default nil)
(global-display-line-numbers-mode)
(setq linum-format "%4d")
(menu-bar-mode 0)
(tool-bar-mode -1)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "SteelBlue4")))))
(show-paren-mode t)
(set-face-foreground 'minibuffer-prompt "white")
(set-face-background 'minibuffer-prompt "black")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company corfu evil ivy)))
(show-paren-mode t)

(require 'ivy)
(ivy-mode t)
(define-key global-map (kbd "C-x C-b") 'ivy-switch-buffer)

(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq scroll-step 1)

(company-mode t)
(add-hook 'after-init-hook 'global-company-mode)
