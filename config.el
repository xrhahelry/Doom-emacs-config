;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;; (setq doom-font (font-spec :family "JetBrainsMono NF" :size 20 :weight 'regular)
      ;; doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))

(setq doom-theme 'doom-one)

(setq doom-font (font-spec :family "JetBrains Mono" :size 20)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 15)
      doom-big-font (font-spec :family "JetBrains Mono" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(setq evil-default-cursor       '("DodgerBlue1" box)
      evil-normal-state-cursor  '("gray" box)
      evil-emacs-state-cursor   '("orange" box)
      evil-motion-state-cursor  '("SeaGreen1" box)
      evil-insert-state-cursor  '("white" box)
      evil-visual-state-cursor  '("white" box)
      evil-replace-state-cursor '("pink" box))

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

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
