
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; GLOBAL EMACS OPTIONS ;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; mode

(winner-mode 1)
(global-hi-lock-mode 1)
(ido-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(global-linum-mode 1)
(global-hl-line-mode 1)
(visual-line-mode t)
(global-visual-line-mode t)

;; variable

(setq x-alt-keysym 'meta)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(setq display-time-mode t)
(setq display-battery-mode t)
(display-time)
(setq size-indication-mode t)
(setq-default indicate-empty-lines t)
(setq-default show-trailing-whitespace t)
(setq-default indicate-buffer-boundaries 'left)
(setq bookmark-save-flag 1)
(put 'narrow-to-region 'disabled nil)
(setq large-file-warning-threshold nil)
(put 'scroll-left 'disabled nil)
(setq standard-indent 2)
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
(fset 'yes-or-no-p 'y-or-n-p)


(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name))
)

;;(add-to-list 'default-frame-alist '(fullscreen . maximized))
;;(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)

(when window-system
  (let (
        (px (display-pixel-width))
        (py (display-pixel-height))
        (fx (frame-char-width))
        (fy (frame-char-height))
        tx ty
        )
    ;; Next formulas discovered empiric on Windows host with default font.
    (setq tx (- (/ px fx) 7))
    (setq ty (- (/ py fy) 4))
    (setq initial-frame-alist '((top . 2) (left . 2)))
    (add-to-list 'initial-frame-alist (cons 'width tx))
    (add-to-list 'initial-frame-alist (cons 'height ty))
    )
)

(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            SKILL language                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;(setq mySKILLKeywords
; '(
;      ("[\][*].*[*][\]" . font-lock-comment-delimiter-face)
;      (";" . font-lock-comment-face)
;      ("[^ ]+[ ]*=\\" . font-lock-variable-name-face)
;
;("db.*[(]\\|ge.*[(]\\|le.*[(]\\|case\\|when\\|if(\\|case(\\|foreach(\\|for(\\|procedure(\\|let(\\|prog(\\|return(\\|c[ad]+r(\\|append[1]+(\\|[:alpha:]p(\\|[^ ]+(" . font-lock-function-name-face)
;
;  )
;)
;
;(define-derived-mode SKILL-mode fundamental-mode
;  (setq font-lock-defaults '(mySKILLKeywords))
;  (setq mode-name "SKILL")
;)
;
;(add-to-list 'auto-mode-alist '("\\.il\\'" . SKILL-mode))
;(normal-erase-is-backspace-mode 1)
;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            colour customization                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;;(require 'highlight-parentheses)
;
;;(define-globalized-minor-mode global-highlight-parentheses-mode highlight-parentheses-mode
;;  (lambda nil (highlight-parentheses-mode t)))
;;(global-highlight-parentheses-mode t)
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.


(custom-set-variables
'(global-auto-revert-mode t)
'(show-paren-mode t)
)
(custom-set-faces
'(font-lock-comment-face ((default nil) (nil (:foreground "dark red" :slant italic :weight bold :height 1.1 :family "italic"))))
'(font-lock-string-face ((((class color) (min-colors 88) (background light)) (:foreground "Brown"))))
'(hl-line ((t (:inherit highlight :background "gold"))))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            keyboard macro                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'hline_place
   [down ?\C-e return ?\\ ?g backspace ?h ?l ?i ?n ?e])

(fset 'readme_make_check_name
   [?\C-  ?\C-\M-f ?\M-w ?\M-> ?\C-u ?2 ?0 ?= return ?\C-y return ?\C-u ?2 ?0 ?- return ?C ?L ?E ?A ?N return return ?\C-u ?\C-  ?\C-u ?\C- ])

(fset 'CS_emacs_subsection
   [?\\ ?s ?u ?b ?s ?e ?c ?t ?i ?o ?n ?\{ ?\} return ?\\ ?b ?e ?g ?i ?n ?\{ ?\} left ?t ?a ?b ?u ?l ?a ?r right ?\{ ?\} left  ?p  ?{  ?0  ?.  ?4  ?\\  ?l  ?i  ?n  ?e  ?w  ?i  ?d  ?t  ?h  ?}  ?  ?p  ?{  ?0  ?.  ?5  ?\\  ?l  ?i  ?n  ?e  ?w  ?i  ?d  ?t  ?h  ?}   right return ?\\ ?h ?l ?i ?n ?e return ?\\ ?t ?e ?x ?t ?b ?f ?\{ ?\} left ?K ?E backspace ?e ?y ?s right ?  ?& ?\S-  ?\\ ?t ?e ?x ?t ?b ?f ?\{ ?\} left ?A ?c ?t ?i ?o ?n ?s right ?\\ ?\\ return ?\\ ?h ?l ?i ?n ?e return ?\\ ?h ?l ?i ?n ?e return ?\\ ?e ?n ?d ?\{ ?\} left ?t ?a ?b ?u ?l ?a ?r right return ?\C-r ?s ?u ?\C-e ?\C-b])


(fset 'perl_uncomment_block
   [?\C-x ?n ?n ?\M-x ?r ?e ?p ?l tab ?r ?e tab ?g tab return ?# kp-multiply left left ?^ right right backspace kp-add return return ?\C-x ?n ?w])

(fset 'copy_full_file_name
   [?\C-h ?v ?b ?u ?f ?f ?e ?r ?- ?f ?i ?l tab ?n ?a ?m ?e return ?\C-x ?o down down right ?\S-\C-e S-left ?\M-w ?\C-x ?0])

(fset 'SKILL_header
   [?\M-< return return return ?\M-< ?\; ?l ?o ?a ?d ?i ?  ?\" ?\M-x ?c ?o ?p tab ?- backspace ?_ ?f ?u ?l ?l tab return ?\C-y ?\"])

(fset 'perl_comment_block
   [?\C-x ?n ?n ?\M-< ?\M-x ?r ?e ?p ?l tab ?r ?e ?g tab return ?^ return ?# return ?\C-x ?n ?w])

(fset 'kill_word_back_cursor
   [?\C-  ?\M-b ?\C-x ?n ?n ?\C-w ?\C-x ?n ?w])

(fset 'backward-kill-line
   [?\C-  ?\C-a ?\C-w])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            bind keys                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-x O") 'previous-multiframe-window)
(global-set-key "\M-K" 'backward-kill-sentence ) ;M-k kills backward sentense
(global-set-key "\M-k" 'kill-sentence ) ;M-K kills forward sentense
(global-set-key [C-f1] 'show-file-name) ; Or any other key you want
(global-set-key "\M-D" 'kill_word_back_cursor ) ;C-d kills word to the left
(global-set-key [delete] 'delete-char ) ;C-d kills word to the left
(global-set-key (kbd "C-S-k") 'backward-kill-line ) ;C-K kills backward line
(global-set-key (kbd "C-M-S-k") 'backward-kill-sexp ) ;C-M-K kills backward balanced expression
(global-set-key [capslock] '[control])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            LaTeX                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(load "/home/aritrab/latex/emacs-rc-tex.el" nil t t)
;(load "/home/aritrab/latex/emacs-rc-preview-pane.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)
(add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)
;;(load "preview-latex.el" nil t t)
;;(setq -default TeX-master nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            END                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



