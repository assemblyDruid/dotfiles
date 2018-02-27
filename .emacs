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
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(auto-save-default nil)
 '(backup-directory-alist (quote (("" . "~/.emacs.d/BACKUPS"))))
 '(beacon-color "#cc6666")
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (assemblyDruid)))
 '(custom-safe-themes
   (quote
    ("ad3824476b250ec3e0195a478da4bbf975520d43ebe2a6e14ef0c8c0c9c49111" default)))
 '(indent-tabs-mode nil)
 '(magit-diff-use-overlays nil)
 '(make-backup-files t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (smart-tab smart-shift smart-semicolon smart-newline smart-cursor-color smart-comment smart-backspace dash color-theme)))
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
   (setq c-basic-offset 4)                  ;; Default is 2
   (setq c-indent-level 4)                  ;; Default is 2

   (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
   (setq tab-width 4)
   (setq indent-tabs-mode nil)  ; spaces == nil | t == tabs
   )
 (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
