;;; package -- summary

;; Package Name: lef verifier
;; Author: Aritra Bhattacharjee
;; Email: aritrabhattacharjee12@gmail.com
;; version: 0.1
;; Release Date: TBD

;;; Commentary:

;; This is a collection of some useful function needed for lef verification.
;; The functions are :
;; add-class-block () for adding class block after macro
;; replace-ground-use () for replacing the use signal for ground pins
;; replace-power-use () for replacing the use signal for power pins

;;; Code:
(defun add-class-block ()
  "Add class block after macro."
  (interactive)
  (goto-char (point-min))
  (search-forward-regexp "^[ ]*\\(macro\\|MACRO\\)[ ]+[^ ]")
  (end-of-line)
  (insert "\nCLASS BLOCK ;"))


(defvar default-timeout 5 "Default timeout value for y-or-n.")

(defun replace-ground-use ()
  "Replace ground from use signal to use ground."
  (interactive)
  (goto-char (point-min))
  (while (search-forward-regexp "^[ ]*\\(pin\\|PIN\\)[ ]+[^ ]*\\(gnd\\|GND\\|VSS\\|vss\\)" nil t)
    (search-forward-regexp "^[ ]*USE[ ]+\\([[:alpha:]]+\\)[ ]*$" nil t)
    (if (equal (match-string 1) "signal")
	(if (y-or-n-p-with-timeout "Replace with Ground? " default-timeout "y")
	    (progn (kill-word -1)
		   (insert "GROUND"))))))

(defun replace-power-use ()
  "Replace ground from use signal to use ground."
  (interactive)
  (goto-char (point-min))
  (while (search-forward-regexp "^[ ]*\\(pin\\|PIN\\)[ ]+[^ ]*\\(vdd\\|VDD\\)" nil t)
    (search-forward-regexp "^[ ]*USE[ ]+\\([[:alpha:]]+\\)[ ]*$" nil t)
    (if (equal (match-string 1) "signal")
	(if (y-or-n-p-with-timeout "Replace with POWER? " default-timeout "y")
	    (progn (kill-word -1)
		   (insert "POWER"))))))


;;; lef-verifier.el ends here


