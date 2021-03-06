;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Matjaz Muhic"
      user-mail-address "")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "Menlo" :size 14))
(setq doom-font (font-spec :family "JetBrains Mono" :size 15))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

;; (load-theme 'doom-one-light t)
(load-theme 'doom-one t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; LSP
(setq lsp-idle-delay 0.5)  ;; clangd is fast

;; Racket
(setq racket-racket-program "/Applications/Racket v7.7/bin/racket")
(setq racket-raco-program "/Applications/Racket v7.7/bin/raco")

;; org-mode
(setq org-directory "~/Dropbox/orgmode")

;; Projectile
(setq projectile-project-search-path '("~/Dev/"))

;; Dired
(setq dired-listing-switches "-la")

;; (setq org-babel-js-function-wrapper "console.log((function() {%s})())")
(setq org-babel-js-function-wrapper "%s")
(defun org-babel-execute:typescript (body params)
  (let ((org-babel-js-cmd "TS_NODE_FILES=true TS_NODE_TRANSPILE_ONLY=true ts-node < "))
    (org-babel-execute:js body params)))

;; Deft
;; (setq deft-extensions '("txt" "org"))
;; (setq deft-directory "~/Dropbox/orgmode")
;; (setq deft-recursive t)

;; exec-path-from-shell
;; A GNU Emacs library to ensure environment variables inside Emacs look the same as in the user's shell.
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Rust
(after! rustic
  (setq rustic-format-on-save t)
  (setq rustic-lsp-server 'rust-analyzer ))


;; Use web-mode for Svelte
(add-to-list 'auto-mode-alist '("\\.svelte\\'" . web-mode))

;; Mode line
(setq mode-line-modes
      (mapcar (lambda (elem)
                (pcase elem
                  (`(:propertize (,_ minor-mode-alist . ,_) . ,_)
                   "")
                  (t elem)))
              mode-line-modes))

;; Set C++11 as default
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-args "-std=c++11")))
