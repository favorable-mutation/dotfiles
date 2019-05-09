;; -- PACKAGES --

;; get package extension
(require 'package)

;; add standard ppa
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; get use-package for easy package management
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; -- LANGUAGE SUPPORT --

;; markdown support
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; racket support
(use-package racket-mode
  :ensure t)

;; django support
(use-package python-django
  :ensure t)


;; -- KEYBINDS --

;; add usable keybinds
(use-package evil
  :ensure t)

(evil-mode t)

;; help should be easier to find
(global-set-key (kbd "C-k") 'describe-key)
(global-set-key (kbd "C-j") 'apropos-documentation)

;; override some evil bindings with more convenient versions of emacs ones
(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map (kbd ";") 'execute-extended-command)
  (define-key evil-normal-state-map (kbd "C-o") 'find-file)
  (define-key evil-normal-state-map (kbd "C-p") 'python-django-open-project))


;; -- THEMING --

;; get gruvbox
(use-package gruvbox-theme
  :ensure t)

(load-theme 'gruvbox t)

;; get powerline
(use-package powerline
  :ensure t
  :config
  (setq powerline-default-separator (if (display-graphic-p) 'arrow nil)))

(use-package powerline-evil
  :ensure t)

(powerline-center-evil-theme)

;; set default font
(set-face-attribute 'default nil :family "Hack")

(set-face-attribute 'default nil :height 160)

;; smooth scrolling pls
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

;; get rid of filetype icons
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)

;; wrap lines at 80 characters
(setq-default fill-column 60)

;; open window at a good size so chunkwm picks it up
(defun set-frame-size ()
  (interactive)
  (progn
    (add-to-list 'default-frame-alist (cons 'width 50))
    (add-to-list 'default-frame-alist (cons 'height 50))))

(set-frame-size)	

;; smooth resize
(setq frame-resize-pixelwise t)


;; -- AUTO --

;; set some variables through the GUI
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(fringe-mode 0 nil (fringe))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages (quote (markdown-mode use-package evil-visual-mark-mode)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
