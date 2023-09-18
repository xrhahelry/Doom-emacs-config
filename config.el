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

(defun prefer-horizontal-split ()
  (set-variable 'split-height-threshold nil t)
  (set-variable 'split-width-threshold 40 t)) ; make this as low as needed
(add-hook 'markdown-mode-hook 'prefer-horizontal-split)

(define-key evil-normal-state-map (kbd "H") (kbd "^"))
(define-key evil-normal-state-map (kbd "L") (kbd "$"))
(define-key evil-visual-state-map (kbd "H") (kbd "^"))
(define-key evil-visual-state-map (kbd "L") (kbd "$"))

(map! :leader
      :desc "Comment or uncomment lines" "TAB TAB" #'comment-line)

(map! :leader
      :desc "Toggle word wrap in org" "m w" #'toggle-truncate-lines)

(map! :leader
      :desc "Switch buffers" "b ." #'ivy-switch-buffer)

(map! :leader
      :desc "Toggle tab bar" "t t" #'centaur-tabs-mode)

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
        org-ellipsis " ▼"
        org-superstar-headline-bullets-list '("◉" "●" "◆" "○" "●" "◆" "○")
        org-superstar-item-bullet-alist '((?+ . ?✦) (?- . ?➤))))

(add-hook 'org-mode-hook
      (lambda ()
        (toggle-truncate-lines nil)))

(after! org
  (setq org-startup-with-inline-images t))

(after! org
  (setq org-agenda-files '("c:/Users/N I T R O 5/Documents/Org/agenda.org")
        org-log-done 'time
        org-log-into-drawer t))

(set-face-attribute 'mode-line nil :font "Cascadia Code-15")
(setq doom-modeline-height 40     ;; sets modeline height
      doom-modeline-bar-width 6   ;; sets right bar width
      doom-modeline-persp-name t  ;; adds perspective name to modeline
      doom-modeline-persp-icon t  ;; adds folder icon next to persp name when set to t
      doom-modeline-buffer-file-name-style 'truncate-upto-project ;; almost full path to file
      doom-modeline-project-detection 'project ;; finds project root folder
      doom-modeline-major-mode-icon nil
      doom-modeline-buffer-modification-icon t ;; removes icon next to file path when file is changed when set to nil
      doom-modeline-highlight-modified-buffer-name nil
      doom-modeline-modal nil
      doom-modeline-modal-icon nil
      doom-modeline-enable-word-count nil)
(after! doom-modeline
  (remove-hook 'doom-modeline-mode-hook #'size-indication-mode) ; filesize in modeline
  (remove-hook 'doom-modeline-mode-hook #'column-number-mode)   ; cursor column in modeline
  (line-number-mode -1)
  (setq doom-modeline-buffer-encoding t))

(use-package time
  :ensure nil
  :hook (after-init . display-time-mode)
  :custom
  (display-time-default-load-average nil))

(use-package battery :ensure nil
  :hook (after-init . display-battery-mode))

(map! :leader
      (:prefix ("d" . "dired")
       :desc "Open dired" "d" #'dired
       :desc "Dired jump to current" "j" #'dired-jump)
      (:after dired
       (:map dired-mode-map
        :desc "Peep-dired image previews" "d p" #'peep-dired
        :desc "Dired view file"           "d v" #'dired-view-file)))
(add-hook 'dired-mode-hook 'nerd-icons-dired-mode)

(evil-define-key 'normal dired-mode-map
  (kbd "M-RET") 'dired-display-file
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-find-file ; use dired-find-file instead of dired-open.
  (kbd "m") 'dired-mark
  (kbd "t") 'dired-toggle-marks
  (kbd "u") 'dired-unmark
  (kbd "C") 'dired-do-copy
  (kbd "D") 'dired-do-delete
  (kbd "J") 'dired-goto-file
  (kbd "M") 'dired-do-chmod
  (kbd "O") 'dired-do-chown
  (kbd "P") 'dired-do-print
  (kbd "R") 'dired-do-rename
  (kbd "T") 'dired-do-touch
  (kbd "Y") 'dired-copy-filenamecopy-filename-as-kill ; copies filename to kill ring.
  (kbd "Z") 'dired-do-compress
  (kbd "+") 'dired-create-directory
  (kbd "-") 'dired-do-kill-lines
  (kbd "% l") 'dired-downcase
  (kbd "% m") 'dired-mark-files-regexp
  (kbd "% u") 'dired-upcase
  (kbd "* %") 'dired-mark-files-regexp
  (kbd "* .") 'dired-mark-extension
  (kbd "* /") 'dired-mark-directories
  (kbd "; d") 'epa-dired-do-decrypt
  (kbd "; e") 'epa-dired-do-encrypt)

(map! "C-;" #'smex)
