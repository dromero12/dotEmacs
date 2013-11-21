(set-face-foreground 'font-lock-comment-face "orange")
(set-mouse-color "goldenrod")

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;(add-to-list 'load-path "/path/to/twittering-mode-3.0.0")
;;(require 'twittering-mode)
;;(setq twittering-icon-mode t)
;;;;(setq twittering-convert-fix-size SIZE)
;;(setq twittering-display-remaining t)
;;(setq twittering-use-master-password t)

;;(setq twittering-initial-timeline-spec-string
;;      '(":direct_messages"
;;        ":replies"
;;        ":favorites"
;;        ":home"))

;; (setq twittering-tinyurl-service 'tinyurl.com)

(defun create-shell ()
    "creates a shell with a given name"
    (interactive);; "Prompt\n shell name:")
    (let ((shell-name (read-string "shell name: " nil)))
    (shell (concat "*" shell-name "*"))))

(mouse-wheel-mode t) 
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq require-final-newline t)
(delete-selection-mode t)

;; Show line-number in the mode line
;;(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;;; Impresion
(setq printer-name "lp") ;Impresora default en Secretaria
;;(setq printer-name "lp2") ; Imprime en Sala Comun
;;(setq printer-name "//econestad/color") ; Imprime en Color
;;(setq ps-printer-name "//econestad/secre") ; si la impresora PostScript es
(setq ps-print-buffer-with-faces t) ; Imprime PS sin/con colores
(setq ps-print-region-with-faces t) ; Imprime PS sin/con colores
(setq ps-paper-type 'a4) ;; Cambia papel a A4 en vez de letter por defecto (PS)
(setq paper-type 'ps-a4) ;; Cambia papel a A4 en vez de letter por defecto (normal)

;; the column beyond which do word wrap
(setq default-fill-column 85)
;; Word wrap
(setq-default auto-fill-function 'do-auto-fill)
;; Acorta lineas largas automaticamente solo en pantalla sin cambiar el lineado
(load "longlines")
;; Mas sobre edicion y finales de linea
;;(setq next-line-add-newlines nil)
(setq-default truncate-lines nil)

(setq-default ispell-check-comments nil)
;;(autoload 'textstats "textstats" "Display text statistics" t)

;; (setq display-time-day-and-date t) ;; allow display of day & date when time
;; (setq display-time-24hr-format t)
;; (setq display-time-interval 15)
;; (display-time)                      ;; display the time

(setq ispell-process-directory (expand-file-name "~/"))

(setq ispell-dictionary "brazilian")
;;(setq ispell-dictionary "espanol")
(defun turn-spell-checking-on ()
  "Turn flyspell-mode on."
  (flyspell-mode 1)
  )
(add-hook 'text-mode-hook 'turn-spell-checking-on)

(global-set-key (kbd "C-c e") 
  (lambda()(interactive)
    (ispell-change-dictionary "espanol")
    (flyspell-buffer))) 

(global-set-key (kbd "C-c p") 
  (lambda()(interactive)
    (ispell-change-dictionary "brazilian")
    (flyspell-buffer))) 

(global-set-key (kbd "C-c i") 
  (lambda()(interactive)
    (ispell-change-dictionary "american")
    (flyspell-buffer))) 

;;; Octave
(autoload 'octave-mode "octave-mod" nil t)  ;; lanza con M-x run-octave
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
; font-lock, autofill y abreviaturas
(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))


 (show-paren-mode 1)
 (set-face-background 'show-paren-match-face "light blue")
 (set-face-foreground 'show-paren-match-face "red")

;;(setq locale-coding-system 'iso-8859-1-unix)
;;(set-terminal-coding-system 'iso-8859-1-unix)
;;(set-keyboard-coding-system 'iso-8859-1-unix)
;;(set-selection-coding-system 'iso-8859-1-unix)
;;(prefer-coding-system 'iso-8859-1-unix)

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(global-set-key (kbd "C-x C-m i") 'set-input-method)

;;**************************
(global-auto-revert-mode t)
;;**************************

;; (global-hl-line-mode 1)
;; (set-face-background 'hl-line "#122")

;;(set-face-background 'highlight "#122")
;;(set-face-foreground 'highlight "#211")

;;(set-face-underline-p 'highlight t)

(set-face-background 'default "black")
(set-face-foreground 'default "white")

(set-face-background 'region "black")
(set-face-foreground 'region "red")

(set-foreground-color "white")
(set-background-color "black")

(set-cursor-color "red")

;; /******/
(set-face-attribute 'default nil :font "-xos4-terminus-medium-r-normal--20-200-72-72-c-100-iso8859-1")
;; /******/

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(global-set-key (kbd "S-C-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'enlarge-window)
(global-set-key (kbd "S-C-<up>") 'shrink-window)

;; (global-set-key (kbd "C-x <left>") 'shrink-window-horizontally)
;; (global-set-key (kbd "C-x <right>") 'enlarge-window-horizontally)
;; (global-set-key (kbd "C-x <up>") 'shrink-window)
;; (global-set-key (kbd "C-x <down>") 'enlarge-window)

;; (setq browse-url-generic-program (executable-find "lynx"))
;; (setq browse-url-browser-function 'browse-url-generic)

(setq tramp-default-method "ssh")

(autoload 'rfc2047-decode-string "rfc2047")
(autoload 'rfc2047-decode-region "rfc2047")
(setq rmail-message-filter
      (lambda ()
        (save-excursion
          (when (search-forward "\n\n" nil t)
            (rfc2047-decode-region
              (point-min) (match-beginning 0)))))
      rmail-summary-line-decoder
      (function rfc2047-decode-string))


(defun swap-buffer ()
  (interactive)
  (cond ((one-window-p) (display-buffer (other-buffer)))
        ((let* ((buffer-a (current-buffer))
                (window-b (cadr (window-list)))
                (buffer-b (window-buffer window-b)))
           (set-window-buffer window-b buffer-a)
           (switch-to-buffer buffer-b)
           (other-window 1)))))

;; Set Linum-Mode on
(global-linum-mode t)
 
;; Linum-Mode and add space after the number
(setq linum-format "%d ")

(global-set-key (kbd "C-c t") 'indent-region)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "C-q") 'query-replace)
(global-set-key (kbd "C-c q") 'query-replace-regexp)

;; ******************** Pomodoro ****************************
;;; pomodoro.el --- Pomodoro Technique for emacs

;;; Commentary:

;; The technique is described in http://www.pomodorotechnique.com
;;
;; to start the pomodoro you issue the following command:
;;
;; M-x pomodoro
;;
;; in the modeline you will see the following indicator W1-25. This
;; means that you are working on set 1 and that you have 25 minutes
;; remaining. The counter will decrease each minutes. When it reaches
;; 0 you will get a message in a buffer that it's time to take a
;; break. The modeline will display B1-5, that is you have a break of
;; 5 minutes. When the count reaches 0 you will another message to get
;; back to work and the set number will increase. At the end of the
;; 4th set you will get a long break. The modeline will display LB
;; instead of B.
;;
;; When you don't need the pomodoro anymore you do:
;;
;; M-x pomodoro-stop
;;
;; I you got interrupted and you want to rewind the pomodoro on the
;; current set just do:
;;
;; M-x pomodoro-rewind
;;
;; Calling M-x pomodoro again will reset it to the first working set
;;
;; You can customize this mode with the following variables:
;;  - `pomodoro-work-time' number of minutes of working
;;  - `pomodoro-short-break' number of minutes of a short break
;;  - `pomodoro-long-break' number of minutes of a long break
;;  - `pomodoro-set-number' number of sets until a long break
;;  - `pomodoro-set-number' the minutes of a working set with

;;; THANKS:

;; Obviously Francesco Cirillo for creating the technique. I was
;; inspired by a pomodoro timer for Windows but I can't find out who
;; wrote it...
;; Richard Riley for pointing out I forgot provide
;; Manan Tuli for fixing the modeline and adding a hook

;;; BUGS:

;; Are you kidding me? This software is perfect ;)

;;; INSTALLATION:

;; To activate this package simply put this file in your load path.
;; For example if you put the file is in the directory ~/tmp you need
;; to do the following :
;;
;; (add-to-list 'load-path "~/tmp")
;; (require 'pomodoro)
;;

;;; Code:

(defvar pomodoro-work-time 25
  "Time in minutes of work")

(defvar pomodoro-short-break 5
  "Time in minute of short break")

(defvar pomodoro-long-break 15
  "Time in minute of long break")

(defvar pomodoro-set-number 4
  "Number of sets until a long break")

(defvar pomodoro-buffer-name "*pomodoro*"
  "Name of the pomodoro buffer")

(defvar pomodoro-raise-frame t
  "When t raise frame on pomodoro notification")

(defvar pomodoro-message-hook nil
  "Hook run on pomodoro notification.
The function take one argument that is the message to be
diplayed")

(defvar pomodoro-work-format " Trabalhando: %d-%d min"
  "String displayed in the modeline when working.")

(defvar pomodoro-break-format " Intervalo: %d-%d min"
  "String displayed in the modeline for a break.")

(defvar pomodoro-long-break-format " Interalo longo: %d min"
  "String displayed in the modeline for a long break.")

(defvar pomodoro-display-string "")
(defvar pomodoro-minute)
(defvar pomodoro-set)
(defvar pomodoro-timer nil)
(defvar pomodoro-state 'work)

;;;###autoload
(defun pomodoro ()
  "Start pomodoro, also rewind pomodoro to first set."
  (interactive)
  (when pomodoro-timer
    (cancel-timer pomodoro-timer))
  (or global-mode-string (setq global-mode-string '("")))
  (or (memq 'pomodoro-display-string global-mode-string)
      (setq global-mode-string
            (append global-mode-string '(pomodoro-display-string))))
  (setq pomodoro-minute pomodoro-work-time
        pomodoro-set 1
        pomodoro-state 'work
        pomodoro-timer (run-at-time t 60 'pomodoro-timer))
  (pomodoro-update-modeline))

;;;###autoload
(defun pomodoro-rewind ()
  "Rewind pomodoro, keep current set"
  (interactive)
  (setq pomodoro-minute pomodoro-work-time
        pomodoro-state 'work)
  (pomodoro-update-modeline))

;;;###autoload
(defun pomodoro-stop ()
  "Stop pomodoro."
  (interactive)
  (when pomodoro-timer
    (cancel-timer pomodoro-timer))
  (setq pomodoro-display-string "")
  (when (get-buffer pomodoro-buffer-name)
    (kill-buffer "*pomodoro*")))

(defun pomodoro-timer ()
  "Function called every minute.
It takes care of updating the modeline as well a message buffer"
  (setq pomodoro-minute (- pomodoro-minute 1))
  (when (<= pomodoro-minute 0)
    (cond ((eq pomodoro-state 'long-break)
           (setq pomodoro-state 'work
                 pomodoro-minute pomodoro-work-time)
           (pomodoro-message "** Trabalho **"))
          ((eq pomodoro-state 'short-break)
           (setq pomodoro-state 'work
                 pomodoro-minute pomodoro-work-time)
           (setq pomodoro-set (+ pomodoro-set 1))
           (pomodoro-message "** Trabalho **"))
          ((eq pomodoro-state 'work)
           (if (>= pomodoro-set pomodoro-set-number)
               (progn
                 (setq pomodoro-minute pomodoro-long-break
                       pomodoro-state 'long-break
                       pomodoro-set 1)
                 (pomodoro-message "** Intervalo longo **"))
             (setq pomodoro-minute pomodoro-short-break
                   pomodoro-state 'short-break)
             (pomodoro-message "** Intervalo curto **")))))
  (pomodoro-update-modeline))

(defun pomodoro-update-modeline ()
  "Update the modeline."
  (setq pomodoro-display-string
        (cond ((eq pomodoro-state 'work)
               (format pomodoro-work-format
                       pomodoro-set pomodoro-minute))
              ((eq pomodoro-state 'short-break)
               (format pomodoro-break-format
                       pomodoro-set pomodoro-minute))
              (t
               (format pomodoro-long-break-format
                       pomodoro-minute))))
  (force-mode-line-update))

(defun pomodoro-message (msg)
  "Display a message in a buffer and maybe raise emacs frame."
  (when pomodoro-raise-frame
    (raise-frame (selected-frame)))
  (let ((this-window (selected-window)))
    (with-current-buffer (get-buffer-create pomodoro-buffer-name)
      (erase-buffer)
      (insert msg))
    (pop-to-buffer pomodoro-buffer-name)
    (fit-window-to-buffer)
    (select-window this-window))
  (run-hook-with-args 'pomodoro-message-hook msg))

(provide 'pomodoro)

;; *******************************************************

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(inhibit-startup-screen t)
 '(safe-local-variable-values (quote ((TeX-auto-save . t))))
 '(scroll-bar-mode (quote right)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

