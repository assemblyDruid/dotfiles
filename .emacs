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
  (c-set-offset 'brace-list-open '0)
  (c-set-offset 'substatement-open '0)
  (c-set-offset 'topmost-intro '0)
  (c-set-offset 'defun-block-intro '+)
  (c-set-offset 'inline-open '0)
  (c-set-offset 'block-open '0)
  (c-set-offset 'case-label '0))
(add-hook 'c-mode-hook 'assemblyDruid-c-mode)
(add-hook 'c++-mode-hook 'assemblyDruid-c-mode)
(add-to-list 'auto-mode-alist '("\\.hlsl\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.vert\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.vrt\\'" .  c-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.frg\\'" .  c-mode))

;; Ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x g") 'ibuffer-do-sort-by-filename/process)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(setq ibuffer-expert t)
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("C/C++" (or
                         (mode . c-mode)
                         (mode . c++-mode)))
               ("Shaders" (or
                           (name . ".hlsl")
                           (name . ".glsl")
                           (name . ".frag")
                           (name . ".frg")
                           (name . ".vert")
                           (name . ".vrt")))
               ("Assembler" (mode . asm-mode))
               ("Dired" (mode . dired-mode))
               ("Emacs" (or
                         (name . ".emacs")
                         (name . "*GNU Emacs*")
                         (name . "*Completions*")
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))
               ("Shell" (or
                         (mode . sh-mode)))))))
(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-auto-mode 1)
             (ibuffer-switch-to-saved-filter-groups "default")))

;; Compilation
(global-set-key (kbd "C-x p") 'compile)
(setq compilation-ask-about-save nil)

;; General
(set-default-font "Liberation Mono 10")
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
