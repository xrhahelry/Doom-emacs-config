(setq doom-theme 'doom-one)

(setq doom-font (font-spec :family "JetBrains Mono" :size 20 :weight 'light)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 15 :weight 'light)
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

(setq-default tab-width 2)
(setq-default evil-shift-width tab-width)

(map! :leader
      :desc "Org babel tangle" "m B" #'org-babel-tangle)
(after! org
  (setq inhibit-compacting-font-caches t)
  (custom-set-faces
    '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
    '(org-level-2 ((t (:inherit outline-2 :height 1.4))))
    '(org-level-3 ((t (:inherit outline-3 :height 1.3))))
    '(org-level-4 ((t (:inherit outline-4 :height 1.2))))
    '(org-level-5 ((t (:inherit outline-5 :height 1.1)))))
  (setq org-directory "c:/Users/N I T R O 5/Documents/Org/"
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
        org-superstar-item-bullet-alist '((?+ . ?✦) (?- . ?➤)) ; changes +/- symbols in item lists
        ))

(add-hook 'org-mode-hook
      (lambda ()
        (toggle-truncate-lines nil) ))

(map! :leader
      :desc "Comment or uncomment lines"      "TAB TAB" #'comment-line)

(set-face-attribute 'mode-line nil :font "JetBrains Mono-15")
(setq doom-modeline-height 50     ;; sets modeline height
      doom-modeline-bar-width 5   ;; sets right bar width
      doom-modeline-persp-name t  ;; adds perspective name to modeline
      doom-modeline-persp-icon t) ;; adds folder icon next to persp name

(xterm-mouse-mode 1)

(defun prefer-horizontal-split ()
  (set-variable 'split-height-threshold nil t)
  (set-variable 'split-width-threshold 40 t)) ; make this as low as needed
(add-hook 'markdown-mode-hook 'prefer-horizontal-split)
(map! :leader
      :desc "Clone indirect buffer other window" "b c" #'clone-indirect-buffer-other-window)
