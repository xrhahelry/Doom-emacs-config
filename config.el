(setq doom-theme 'doom-one)

(setq doom-font (font-spec :family "JetBrains Mono" :size 20 :weight 'light)
      doom-variable-pitch-font (font-spec :family "Iosevka" :size 15 :weight 'light)
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

;; (define-key evil-normal-state-map (kbd "^") (kbd "H"))
;; (define-key evil-normal-state-map (kbd "$") (kbd "L"))
;; (define-key evil-visual-state-map (kbd "^") (kbd "H"))
;; (define-key evil-visual-state-map (kbd "$") (kbd "L"))

(map! :leader
      :desc "Org babel tangle" "m B" #'org-babel-tangle)
(after! org
  (setq inhibit-compacting-font-caches t)
  (custom-set-faces
    '(org-level-1 ((t (:inherit outline-1 :height 1.7))))
    '(org-level-2 ((t (:inherit outline-2 :height 1.6))))
    '(org-level-3 ((t (:inherit outline-3 :height 1.5))))
    '(org-level-4 ((t (:inherit outline-4 :height 1.4))))
    '(org-level-5 ((t (:inherit outline-5 :height 1.3))))
    '(org-level-6 ((t (:inherit outline-6 :height 1.2))))
    '(org-level-7 ((t (:inherit outline-7 :height 1.1))))
    '(org-level-8 ((t (:inherit outline-8 :height 1.0)))))
  (setq org-directory "c:/Users/N I T R O 5/Documents/Org/"
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-superstar-headline-bullets-list '("◉" "●" "◆" "○" "●" "◆" "○")
        org-superstar-item-bullet-alist '((?+ . ?✦) (?- . ?➤)) ; changes +/- symbols in item lists
        ))

(add-hook 'org-mode-hook
      (lambda ()
        (toggle-truncate-lines nil) ))

(map! :leader
      :desc "Comment or uncomment lines"      "TAB TAB" #'comment-line)

(set-face-attribute 'mode-line nil :font "Cascadia Code-15")
(setq doom-modeline-height 40     ;; sets modeline height
      doom-modeline-bar-width 5   ;; sets right bar width
      doom-modeline-persp-name t  ;; adds perspective name to modeline
      doom-modeline-persp-icon t  ;; adds folder icon next to persp name when set to t
      doom-modeline-buffer-file-name-style 'truncate-except-project ;; almost full path to file
      doom-modeline-buffer-modification-icon nil ;; removes icon next to file path when file is changed
      doom-modeline-project-detection 'project ;; does something when working in a project
      doom-modeline-major-mode-icon nil
      doom-modeline-highlight-modified-buffer-name nil
      doom-modeline-modal nil
      doom-modeline-modal-icon nil
      doom-modeline-battery t
      doom-modeline-time t)
(after! doom-modeline
  (remove-hook 'doom-modeline-mode-hook #'size-indication-mode) ; filesize in modeline
  (remove-hook 'doom-modeline-mode-hook #'column-number-mode)   ; cursor column in modeline
  (line-number-mode -1)
  (setq doom-modeline-buffer-encoding nil))

(xterm-mouse-mode 1)

(defun prefer-horizontal-split ()
  (set-variable 'split-height-threshold nil t)
  (set-variable 'split-width-threshold 40 t)) ; make this as low as needed
(add-hook 'markdown-mode-hook 'prefer-horizontal-split)
