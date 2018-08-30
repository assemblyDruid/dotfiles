(package-initialize)

;;
;;
;; Show 'buffer-menu in current window
;; (rebinding)
;;
;;
(global-set-key "\C-x\C-b" 'buffer-menu)

;;
;;
;; C/C++ Indent
;;
;;
(setq-default c-indent-tabs-mode t     ; Pressing TAB should cause indentation
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
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#666666" "#FFFFFF" "#EEEEEE" "#ffffff" "#ffffff" "#FFFFFF" "#ffffff" "#ffffff"])
 '(custom-enabled-themes (quote (eziam-light)))
 '(custom-safe-themes
   (quote
    ("44247f2a14c661d96d2bff302f1dbf37ebe7616935e4682102b68c0b6cc80095" "242527ce24b140d304381952aa7a081179a9848d734446d913ca8ef0af3cef21" "9fcac3986e3550baac55dc6175195a4c7537e8aa082043dcbe3f93f548a3a1e0" default)))
 '(fci-rule-color "#444444")
 '(package-selected-packages
   (quote
    (eziam-theme subatomic-theme smart-tab smart-shift smart-semicolon smart-newline smart-cursor-color smart-comment smart-backspace rust-mode go-tag go-stacktracer go-snippets go-scratch go-projectile go-playground-cli go-playground go-imports go-impl go-gopath go-gen-test go-fill-struct go-errcheck go-dlv go-direx go-complete go-autocomplete color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-theme)))
 '(pdf-view-midnight-colors (quote ("#ffffff" . "#444444")))
 '(vc-annotate-background "#444444"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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
;; No bells/alarms
;;
;;
(setq visible-bell 1)
(setq ring-bell-function 'ignore)


;;
;;
;; No nex-line (major performance improvement)
;;
;;
(setq auto-window-vscroll nil)
(setq line-move-visual nil)
(setq gc-cons-threshold 100000000)
