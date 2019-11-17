(package-initialize)

;; No completions Buffer
(add-hook 'minibuffer-exit-hook
	  '(lambda ()
	     (let ((buffer "*Completions*"))
	       (and (get-buffer buffer)
		    (kill-buffer buffer)))))
;; C/C++ Indent
(setq c-default-style "bsd"
  c-basic-offset 4)
(setq-default c-indent-tabs-mode nil
	      c-indent-level 4
	      c-argdecl-indent 0
	      c-tab-always-indent t
	      backward-delete-function nil)
(defun assemblyDruid-c-mode ()
  (c-basic-offset 4)
  (c-continued-statement-offset 0) ;; Note: was previously 4
  (c-set-offset 'substatement-open '0)
  (c-set-offset 'topmost-intro '+)
  (c-set-offset 'defun-block-intro' '++)
  (c-set-offset 'inline-open '-)
  (c-set-offset 'block-open '+)
  (c-set-offset 'brace-list-open '0)
  (c-set-offset 'case-label '+))
(add-hook 'c-mode-hook 'assemblyDruid-c-mode)
(add-hook 'c++-mode-hook 'assemblyDruid-c-mode)

;; Ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x g") 'ibuffer-do-sort-by-filename/process)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(setq ibuffer-expert t)
(setq ibuffer-show-empty-filter-groups nil)
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
                         (mode . sh-mode)))
               ("C/C++" (or
                         (mode . c-mode)
                         (mode . c++-mode)))))))
(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-auto-mode 1)
             (ibuffer-switch-to-saved-filter-groups "default")))

;; Compilation
(global-set-key (kbd "C-x p") 'compile)
(setq compilation-ask-about-save nil)

(set-default-font "Liberation Mono")
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-auto-revert-mode t)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode 0)
(set-window-fringes nil 0 0)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq-default message-log-max nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-window-vscroll nil)
(setq line-move-visual nil)
(fset 'yes-or-no-p 'y-or-n-p)
(kill-buffer "*Messages*")

(custom-set-variables
 '(custom-enabled-themes (quote (assemblyDruid)))
 '(custom-safe-themes
   (quote
    ("dab3b70c98fc53c36a7d7add56fe5bd8bd4a7b19caf8bef1fba586fb3b76c137" default))))
(custom-set-faces)
