
;; -------------------------------------------------------------------------------------
;; -------------------------------------------------------------------------------------
;; -------------------------------------------------------------------------------------

;; display line number
(add-to-list 'load-path "~/.emacs.d/")
(load "linum.el")
(global-linum-mode 9)
;; automatic indentation
;;c-set-offset 'substatement-open 0)
;;(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
;;(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)))
;; Math mode for LaTex
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; enable french keyboard system
(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)


;; -------------------------------------------------------------------------------------
;; ----------------------      PLUG IN      --------------------------------------------
;; -------------------------------------------------------------------------------------
;; snippet avec yasnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
(defun region-active-p ()  (and transient-mark-mode mark-active))


;; tabbar
(add-to-list 'load-path
              "~/.emacs.d/plugins/tabbar")
(require 'tabbar)
(tabbar-mode)
; turn on the tabbar
(tabbar-mode t)

(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
This function is a custom function for tabbar-mode's tabbar-buffer-groups.
This function group all buffers into 3 groups:
Those Dired, those user buffer, and those emacs buffer.
Emacs buffer are those starting with “*”."
  (list
   (cond
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer"
     )
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    (t
     "User Buffer"
     )
    ))) 

(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)
(setq tabbar-background-color "#181818") ;; the color of the tabbar background
(custom-set-faces
 '(tabbar-default ((t (:inherit variable-pitch :background "#181818" :foreground "black" :weight bold))))
 '(tabbar-button ((t (:inherit tabbar-default :foreground "#080808"))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default))))
 '(tabbar-highlight ((t (:underline t))))
 '(tabbar-selected ((t (:inherit tabbar-default :background "181818"))))
 '(tabbar-separator ((t (:inherit tabbar-default :background "white"))))
 '(tabbar-unselected ((t (:inherit tabbar-default)))))

;; tabbar : switch buffer windows keybinding 
(global-set-key (kbd "C-x :") 'tabbar-backward-tab)
(global-set-key (kbd "C-x =") 'tabbar-forward-tab)


;; <- END PLUG IN







;; Acces au changement de buffer plus simple
(iswitchb-mode t)

(add-to-list 'iswitchb-buffer-ignore "*Messages")
(add-to-list 'iswitchb-buffer-ignore "*scratch")
(add-to-list 'iswitchb-buffer-ignore "*Buffer")
(add-to-list 'iswitchb-buffer-ignore "*Completions")
(add-to-list 'iswitchb-buffer-ignore "*debug")
(add-to-list 'iswitchb-buffer-ignore "*gud")
(add-to-list 'iswitchb-buffer-ignore "*breakpoints")
(add-to-list 'iswitchb-buffer-ignore "*Bookmark")
(add-to-list 'iswitchb-buffer-ignore "*Man")
(add-to-list 'iswitchb-buffer-ignore "*tramp")
(add-to-list 'iswitchb-buffer-ignore "/ftp")
(add-to-list 'iswitchb-buffer-ignore "*ftp")

;; email with gnus
(setq send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "smtp.gmail.com")
(setq smtpmail-smtp-service 25)
(setq smtpmail-auth-credentials '(("smtp.gmail.com" 25 "mickael.kerjean" "12111989")))
(setq smtpmail-starttls-credentials '(("smtp.gmail.com" 25 nil nil)))
;; rajoute le mode majeur pour matlab
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))

;; supprime l'affichage du message d'accueil
(setq inhibit-startup-message t)
;; affiche l'heure dans la bare de status
(load "time" t t)
(display-time)
;; highlight selected text
(transient-mark-mode t)
;; supprime tous les espaces en fin de ligne
(autoload 'nuke-trailing-whitespace "whitespace" nil t)
;; Recherche automatique des fermetures et ouvertures des parenthÃ¨ses
(load-library "paren")
(show-paren-mode 1)
; Affichage des images et fichiers compressÃ©s
(setq auto-image-file-mode t)
(setq auto-compression-mode t)
;; Pour enregistrer automatiquement la position du curseur quand on quitte un
;; fichier, et y retourner automatiquement Ã  la rÃ©ouverture
(require 'saveplace)
(setq-default save-place t)
;; Circuler entre les vues par ctrl-tab
; (global-set-key [(ctrl tab)] 'bury-buffer) ; use in tabbar
;; Annuler par ctrl-z
(global-set-key [(control z)] 'undo)
;; Parenthese matching, permet de verifier au fur et Ã  mesure de la frappe que
;; l'on ferme bien ce que l'on ouvre, aussi bien pour les parenthÃ¨ses que les
;; crochets ou les accolades.
(require 'paren)
(show-paren-mode 1)
(setq-default hilight-paren-expression t)
;; Pour ne pas avoir Ã  taper en entier la rÃ©ponse yes/no
(fset 'yes-or-no-p 'y-or-n-p)
;; recentf stuff
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; raccourci la taille de la fenetre de compil
(setq compilation-window-height 25)
;; tabulation automatique
(setq c-auto-newline t)
;;affiche les espaces inutile
(setq-default show-trailing-whitespace t)
(defun my-html-helper-load-hook ()
  (define-key html-mode-map (kbd "RET") 'newline-and-indent)
  )
(add-hook 'html-helper-load-hook 'my-html-helper-load-hook)
;; key binding
(global-set-key [f1] 'shell)
(global-set-key [f2] 'compile)
(global-set-key [f3] 'gdb)
(global-set-key [f4] 'delete-trailing-whitespace)
(global-set-key [f6]'comment-region)
(global-set-key [S-f6]'uncomment-region)
;; zen coding plug in
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
;; css indent
(setq cssm-indent-function #'cssm-c-style-indenter)

;; -------------------------------------------------------------------------------------
;; -------------------------------------------------------------------------------------
;; -------------------------------------------------------------------------------------
;; color theme


(defun your-config-name-here ()
  (interactive)
  (color-theme-install
   '(your-config-name-here
     ((background-color . "#181818")
     (background-mode . light)
     (border-color . "#969696")
     (cursor-color . "#ffffff")
     (foreground-color . "#cfcab5")
     (mouse-color . "black"))
     (fringe ((t (:background "#969696"))))
     (mode-line ((t (:foreground "#ffffff" :background "#595959"))))
     (region ((t (:background "#666666"))))
     (font-lock-builtin-face ((t (:foreground "#cbae52"))))
     (font-lock-comment-face ((t (:foreground "#6e726e"))))
     (font-lock-function-name-face ((t (:foreground "#b7a385"))))
     (font-lock-keyword-face ((t (:foreground "#6891c0"))))
     (font-lock-string-face ((t (:foreground "#c77429"))))
     (font-lock-type-face ((t (:foreground"#199915"))))
     (font-lock-constant-face ((t (:foreground "#e6a00f"))))
     (font-lock-variable-name-face ((t (:foreground "#e6a00f"))))
     (minibuffer-prompt ((t (:foreground "#7299ff" :bold t))))
     (font-lock-warning-face ((t (:foreground "red" :bold t))))
     )))
(provide 'your-config-name-here)

(add-to-list 'load-path "~/.emacs.d/themes")
    (require 'color-theme)
    (eval-after-load "color-theme"
    '(progn
    (color-theme-initialize)
    (your-config-name-here)))

;; ---------------------------------------------------------------------------------
;; create a backup file directory
(setq backup-directory-alist            '((".*" . "~/.Trash")))
;; --------------------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
