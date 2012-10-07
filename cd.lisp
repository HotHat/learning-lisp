;; DESCRIPTION: Follow along the DB example found in the Practical Common Lisp Book
;; AUTHOR: rob Arseneault
;; EMAIL: shoelessrob@gmail.com

(defvar *db* nil)

(defun add-record (cd) (push cd *db*))

(defun make-cd (title artist rating ripped)
  (list :title title :artist artist :rating rating :ripped ripped))

(defun dump-db ()
  (dolist ( cd *db* )
    (format t "~{~a:~10t~a~%~}~%" cd )))

(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun prompt-for-cd ()
  (make-cd
   (prompt-read "Title: ")   
   (prompt-read "Artist: ")   
   (or (parse-integer (prompt-read "Rating: ") :junk-allowed t) 0)   
   (y-or-n-p "Ripped[y/n]?: ")))
