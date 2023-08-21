(setq doom-theme 'gruber-darker)

(setq doom-font (font-spec :family "JetBrains Mono" :size 20)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 15)
      doom-big-font (font-spec :family "JetBrains Mono" :size 24))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(setq evil-default-cursor       'box
      evil-normal-state-cursor  'box
      evil-emacs-state-cursor   'box
      evil-motion-state-cursor  'box
      evil-insert-state-cursor  'box
      evil-visual-state-cursor  'box
      evil-replace-state-cursor 'box)

(setq display-line-numbers-type 'relative)

(setq org-directory "c:/Users/N I T R O 5/Documents/org/")

(map! :leader
      :desc "Comment or uncomment lines"      "TAB TAB" #'comment-line)

(set-face-attribute 'mode-line nil :font "JetBrains Mono-13")
(setq doom-modeline-height 40     ;; sets modeline height
      doom-modeline-bar-width 8   ;; sets right bar width
      doom-modeline-persp-name t  ;; adds perspective name to modeline
      doom-modeline-persp-icon t) ;; adds folder icon next to persp name

(xterm-mouse-mode 1)

(defun prefer-horizontal-split ()
  (set-variable 'split-height-threshold nil t)
  (set-variable 'split-width-threshold 40 t)) ; make this as low as needed
(add-hook 'markdown-mode-hook 'prefer-horizontal-split)
(map! :leader
      :desc "Clone indirect buffer other window" "b c" #'clone-indirect-buffer-other-window)
