;;; package -- summary

;;; Commentary:

;;; Code:
(defun add-class-block ()
  "Add class block after macro."
  (interactive)
  (goto-char (point-min))
  (search-forward-regexp "^[ ]*\\(macro\\|MACRO\\)[ ]+[^ ]")
  (end-of-line)
  (insert "\nCLASS BLOCK ;")
  )

(defvar default-timeout 5 "Default timeout value for y-or-n.")

(defun replace-ground-use ()
  "Replace ground from use signal to use ground."
  (interactive)
  (goto-char (point-min))
  (search-forward-regexp "^[ ]*\\(pin\\|PIN\\)[ ]+\\(agnd\\|AGND\\|gnd\\|GND\\|VSS\\|AVSS\\)")
  (search-forward-regexp "^[ ]*USE[ ]+\\([[:alpha:]]+\\)[ ]*$")
  (if (equal (match-string 1) "signal")
      (if (y-or-n-p-with-timeout "Replace with Ground? " default-timeout "y")
	  (progn (kill-word -1)
		 (insert "GROUND"))
	))
  )

;;; lef-verifier.el ends here


