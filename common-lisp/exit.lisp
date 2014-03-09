;;;; This is free and unencumbered software released into the public domain.

(defun exit (&optional (code 0))
  "Terminates the process using the exit code CODE."
  (declare (type (signed-byte 8) code))
  #+abcl (ext:quit :status code)
  #+ccl (ccl:quit code)
  #+clisp (ext:quit code)
  #+cmu (unix:unix-exit code)
  #+ecl (si:quit code)
  #+gcl (lisp:quit code)
  #+mkcl (mk-ext:quit :exit-code code)
  #+sbcl (sb-ext:exit :code code)
  #+xcl (ext:quit :status code)
  #-(or abcl ccl clisp cmu ecl gcl mkcl sbcl xcl)
  (error "process terminated with exit code ~S" code))
