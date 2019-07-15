;; Buffers
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-auto-revert-mode t) ;; update buffers after disk changes

;; Global indentation
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

;; C/C++ Indent
(setq-default c-indent-tabs-mode nil   ; Pressing TAB should cause indentation
                    c-indent-level 4         ; A TAB is equivilent to four spaces
                          c-argdecl-indent 0       ; Do not indent argument decl's extra
                                c-tab-always-indent t
                                      backward-delete-function nil) ; DO NOT expand tabs when d
eleting
(c-add-style "my-c-style" '((c-continued-statement-offset 4))) ; If a statement continues on th
e next line, indent the continuation by 4
(defun my-c-mode-hook ()
  (c-set-style "my-c-style")
  (c-set-offset 'substatement-open '0) ; brackets should be at same indentation level as the st
atements they open
  (c-set-offset 'inline-open '+)
  (c-set-offset 'block-open '+)
  (c-set-offset 'brace-list-open '+)   ; all "opens" should be indented by the c-indent-level
  (c-set-offset 'case-label '+))       ; indent case labels by c-indent-level, too
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)

;; Disable unwanted defaults
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode 0)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)
(setq inhibit-splash-screen t)
(setq auto-window-vscroll nil)
(setq line-move-visual nil)
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Ibuffer
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
               ("C/C++" (or
                         (mode . c-mode)
                         (mode . c++-mode)))))))

(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-auto-mode 1)
             (ibuffer-switch-to-saved-filter-groups "default")))
(setq ibuffer-show-empty-filter-groups nil)
