;; TextMate behaviour on Emacs
;; Copyright (C) 2008  Orestis Markou

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
;;
;; You can file issues, send comments and get the latest version at:
;; http://code.google.com/p/emacs-textmate/
;;
;; Contributions welcome!
;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-minor-mode textmate-mode
       "Toggle Textmate mode.
     With no argument, this command toggles the mode.
     Non-null prefix argument turns on the mode.
     Null prefix argument turns off the mode.
"     
      ;; The initial value.
      nil
      ;; The indicator for the mode line.
      " TM"
      ;; The minor mode bindings.
      '(([backspace] . textmate-backspace2)
	([return] . css-line-open)
        ("\"" . textmate-move-over-dbl-quote)
        ("\'" . textmate-move-over-quote)
        (")" . textmate-move-over-bracket)
        ("]" . textmate-move-over-square)
        ("}" . textmate-move-over-curly)
        ("[" . skeleton-pair-insert-maybe)
        ("(" . skeleton-pair-insert-maybe)
        ("{" . skeleton-pair-insert-maybe) )       
      :group 'textmate
      (progn
        (setq skeleton-pair t)))

;;implementation stuff

(setq textmate-pairs '( ( ?\( . ?\) )
  (  ?\' . ?\' )
  (  ?\" . ?\" )
  (  ?[ . ?] )
  (  ?{ . ?} )
  )
      )

(defun textmate-is-empty-pair ()
  (interactive)
  (eq (cdr (assoc (char-before)  textmate-pairs)) (char-after)  )
  )

(defun textmate-backspace2 ()
 (interactive)
 (if (eq (char-after) nil)
  nil   ;; if char-after is nil, just backspace
 (if (textmate-is-empty-pair)
     (delete-char 1)
   )
 )
(backward-delete-char 1)
)

(setq textmate-pushovers
      '(
        (?\" . (lambda () (forward-char 1) ))
        (?\' . (lambda () (forward-char 1) ))
        (?\) . (lambda () (up-list 1) ))
        (?\] . (lambda () (up-list 1) ))
        (?\} . (lambda () (up-list 1) ))
        ))

(setq textmate-defaults
      '(
        (?\" . (lambda () (skeleton-pair-insert-maybe nil) ))
        (?\' . (lambda () (skeleton-pair-insert-maybe nil) ))
        (?\) . (lambda () (insert-char ?\) 1) ))
        (?\] . (lambda () (insert-char ?\] 1) ))
        (?\} . (lambda () (insert-char ?\} 1) ))
        ))

(defun textmate-move-over (char)
(if (eq (char-after) char)
    (funcall (cdr (assoc char textmate-pushovers)))
    (funcall (cdr (assoc char textmate-defaults)))
  )
)


(defun textmate-move-over-bracket ()
  (interactive)
  (textmate-move-over ?\) ))

(defun textmate-move-over-curly ()
  (interactive)
  (textmate-move-over ?\} ))

(defun textmate-move-over-square ()
  (interactive)
  (textmate-move-over ?\] ))

(defun textmate-move-over-quote ()
  (interactive)
  (textmate-move-over ?\' ))

(defun textmate-move-over-dbl-quote ()
  (interactive)
  (textmate-move-over ?\" ))

(defun textmate-pair-expand ()
  (interactive)
  (if (is-empty-pair)
      (progn
	(newline)
	(open-line 1)
	(indent-according-to-mode))
    (newline-and-indent)))


