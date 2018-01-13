(package-initialize)
;;
;;
;; MELPA Archives
;;
;;
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (subatomic)))
 '(custom-safe-themes
   (quote
    ("b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" default)))
 '(global-linum-mode t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (rust-mode subatomic-theme smart-tab smart-shift smart-semicolon smart-newline smart-cursor-color smart-comment smart-backspace dash color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-theme)))
 '(ring-bell-function (quote ignore))
 '(tool-bar-mode nil))

;;
;;
;; Faces
;; REQUIREMENT: Hack
;;
;; 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack"))))
 '(fixed-pitch ((t (:family "Hack"))))
 '(variable-pitch ((t (:family "Hack")))))

;;
;;
;; C-Mode Indentation
;;
;;
(defun my-c-mode-common-hook ()
  (c-set-offset 'substatement-open 0)

  (setq c++-tab-always-indent t)
  (setq c-basic-offset 2)                  ;; Default is 2
  (setq c-indent-level 4)                  ;; Default is 2

  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (setq tab-width 4)
  (setq indent-tabs-mode nil)  ; spaces == nil | t == tabs
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
