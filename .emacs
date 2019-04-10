(package-initialize)

;;
;;
;; Buffers
;;
;;
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-auto-revert-mode t) ;; update buffers after disk changes

;;
;;
;; C/C++ Indent
;;
;;
(setq-default c-indent-tabs-mode nil   ; Pressing TAB should cause indentation
	      c-indent-level 4         ; A TAB is equivilent to four spaces
	      c-argdecl-indent 0       ; Do not indent argument decl's extra
	      c-tab-always-indent t
	      backward-delete-function nil) ; DO NOT expand tabs when deleting
(c-add-style "my-c-style" '((c-continued-statement-offset 4))) ; If a statement continues on the next line, indent the continuation by 4
(defun my-c-mode-hook ()
  (c-set-style "my-c-style")
  (c-set-offset 'substatement-open '0) ; brackets should be at same indentation level as the statements they open
  (c-set-offset 'inline-open '+)
  (c-set-offset 'block-open '+)
  (c-set-offset 'brace-list-open '+)   ; all "opens" should be indented by the c-indent-level
  (c-set-offset 'case-label '+))       ; indent case labels by c-indent-level, too
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)


;;
;;
;; Go Indent
;;
;;
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))

;;
;;
;; MELPA
;;
;;
;; (require 'package)
;; (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
;;                     (not (gnutls-available-p))))
;;        (proto (if no-ssl "http" "https")))
;;   (when no-ssl
;;     (warn "\
;; Your version of Emacs does not support SSL connections,
;; which is unsafe because it allows man-in-the-middle attacks.
;; There are two things you can do about this warning:
;; 1. Install an Emacs version that does support SSL and be safe.
;; 2. Remove this warning from your init file so you won't see it again."))
;;   ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
;;   (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
;;   ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
;;   (when (< emacs-major-version 24)
;;     ;; For important compatibility libraries like cl-lib
;;     (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
;; (package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#666666" "#FFFFFF" "#EEEEEE" "#ffffff" "#ffffff" "#FFFFFF" "#ffffff" "#ffffff"])
 '(custom-enabled-themes (quote (tao-yin)))
 '(custom-safe-themes
   (quote
    ("dbade2e946597b9cda3e61978b5fcc14fa3afa2d3c4391d477bdaeff8f5638c5" "801a567c87755fe65d0484cb2bded31a4c5bb24fd1fe0ed11e6c02254017acb2" "341b2570a9bbfc1817074e3fad96a7eff06a75d8e2362c76a2c348d0e0877f31" "db0d4caa5e824f1a3bdce571bf11b1b38a1af169b3f2889d022d7d8407324440" "44247f2a14c661d96d2bff302f1dbf37ebe7616935e4682102b68c0b6cc80095" "242527ce24b140d304381952aa7a081179a9848d734446d913ca8ef0af3cef21" "9fcac3986e3550baac55dc6175195a4c7537e8aa082043dcbe3f93f548a3a1e0" default)))
 '(fci-rule-color "#444444")
 '(package-selected-packages
   (quote
    (tao-theme tao-yin-theme ## eziam-theme subatomic-theme smart-tab smart-shift smart-semicolon smart-newline smart-cursor-color smart-comment smart-backspace rust-mode go-tag go-stacktracer go-snippets go-scratch go-projectile go-playground-cli go-playground go-imports go-impl go-gopath go-gen-test go-fill-struct go-errcheck go-dlv go-direx go-complete go-autocomplete color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-theme)))
 '(pdf-view-midnight-colors (quote ("#ffffff" . "#444444")))
 '(vc-annotate-background "#444444"))

;;
;;
;; No menu/scroll/tool bar/blinking cursor
;;
;;
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode 0)

;;
;;
;; No bells/alarms/splash
;;
;;
(setq visible-bell 1)
(setq ring-bell-function 'ignore)
(setq inhibit-splash-screen t)

;;
;;
;; No nex-line (major performance improvement)
;;
;;
(setq auto-window-vscroll nil)
(setq line-move-visual nil)
(setq gc-cons-threshold 100000000)

;;
;;
;; Fonts/Faces
;;
;;
(set-frame-font "Consolas" nil t)
(set-default-font "Consolas")

;;
;;
;; Dired
;;
;;
(setq dired-listing-switches "-laGh1v --group-directories-first")
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

;;
;;
;; Global indentation
;;
;;
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

;;
;;
;; Ibuffer
;;
;;
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x g") 'ibuffer-do-sort-by-filename/process)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("Dired" (mode . dired-mode))
               ("Emacs" (or
                         (name . ".emacs")
                         (name . "*GNU Emacs*")
                         (name . "*Completions*")
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))
               ("Assembler" (mode . asm-mode))
               ("Shell" (or
                         (mode . sh-mode)
                         (mode . shell-mode)
                         (mode . eshell-mode)))
               ("Ruby" (or
                        (mode . ruby-mode)))
               ("C/C++" (or
                         (mode . c-mode)
                         (mode . c++-mode)))))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-auto-mode 1)
             (ibuffer-switch-to-saved-filter-groups "default")))

(setq ibuffer-expert t)
(setq ibuffer-show-empty-filter-groups nil)



;;
;;
;; Org-Mode
;;
;;
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" `org-capture)
(setq org-default-notes-file "~/org/exocortex.org")
(setq org-log-done t)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/exocortex.org" "Tasks")
         "* TODO %?\n  %i\n  %a")))

;;
;;
;; Compilation
;;
;;
(global-set-key (kbd "C-x p") 'compile)
(setq compilation-ask-about-save nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
