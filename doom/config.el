;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; General settings
;;
;; Make which-key pop up faster
;;(setq which-key-idle-delay 0.5
;;      which-key-idle-secondary-delay 0)
;; Adjust font size by 1pt
(setq doom-font-increment 1)
;; Map cmd/option keys
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Keymap
;;
(map! :ni "C-<tab>" #'tab-bar-switch-to-recent-tab)
(map! :ni "C-S-<tab>" #'tab-bar-switch-to-prev-tab)
(map! :n "gt" #'tab-bar-switch-to-next-tab)
(map! :n "gT" #'tab-bar-switch-to-prev-tab)
(map! :ni "s-h" #'evil-window-left)
(map! :ni "s-j" #'evil-window-down)
(map! :ni "s-k" #'evil-window-up)
(map! :ni "s-l" #'evil-window-right)

(map! :n "s" #'avy-goto-char-2)

(map! :ni "M-s" #'evil-update)
(map! :n "M-/" #'evilnc-comment-or-uncomment-lines)

;; LSP settings
;;
;;(setq lsp-pyright-venv-path "/Users/ryan/.local/share/virtualenvs")

;; org-mode
;;
;; (after! org
;;   (setq org-fontify-quote-and-verse-blocks t
;;         org-fontify-whole-heading-line t
;;         org-src-fontify-natively t
;;         org-hide-leading-stars t
;;         org-startup-indented t))

;; PDF viewer
;;
;; (after! pdf-tools
;;   (map! :map pdf-view-mode-map :n "C-u" #'pdf-view-previous-page-command)
;;   (map! :map pdf-view-mode-map :n "C-d" #'pdf-view-next-page-command)
;;   (setq pdf-view-midnight-minor-mode t))

;; evil-easymotion
;;
(remove-hook 'doom-first-input-hook #'evil-snipe-mode) ;disable evil-snipe
(use-package! avy
  :after evil-snipe)

;; Doom modeline
;;
(after! doom-modeline
  (setq doom-modeline-persp-name t
        doom-modeline-major-mode-icon t
        doom-modeline-support-imenu t
        doom-modeline-icon t
        doom-modeline-time-icon nil
        doom-modeline-workspace-name t
        doom-modeline-persp-name t
        doom-modeline-persp-icon t
        doom-modeline-lsp t
        doom-modeline-modal-icon t))

;; tab-bar
;;
(after! tab-bar
  (setq tab-bar-close-button-show nil
        tab-bar-button-relief 5
        tab-bar-format '(tab-bar-format-history tab-bar-format-tabs-groups
                         tab-bar-separator tab-bar-format-align-right
                         tab-bar-format-global)
        tab-bar-tab-name-function 'tab-bar-tab-name-current-with-count)
  (defface tab-bar
    '((((class color) (min-colors 88)) :inherit shadow)
      (t :inverse-video t))
    "Tab bar face."
    :group 'basic-faces)
  (defface tab-bar-tab
    '((((class color) (min-colors 88)) :inherit default)
      (t :inverse-video t))
    "Tab bar active tab face."
    :group 'basic-faces)
  (defface tab-bar-tab-inactive
    '((((class color) (min-colors 88)) :inherit shadow :inherit line-number)
      (t :inverse-video t))
    "Tab bar inactive tab face."
    :group 'basic-faces))


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "PragmataPro Liga" :size 16)
      doom-variable-pitch-font (font-spec :family "SF Pro" :size 15))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


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
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
