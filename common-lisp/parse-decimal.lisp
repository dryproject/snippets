;;;; This is free and unencumbered software released into the public domain.

(defun parse-decimal (input-string)
  "Parses a decimal string, returning the corresponding rational number."
  (declare (type string input-string))
  (let* ((separator-position (or (position #\. input-string) 0))
         (integer-part       (parse-integer input-string :junk-allowed t
                                            :end separator-position))
         (fractional-part    (parse-integer input-string :junk-allowed t
                                            :start (1+ separator-position)))
         (fractional-length  (- (length input-string) (1+ separator-position))))
    (when (and integer-part fractional-part)
      (+ integer-part (/ fractional-part (expt 10 fractional-length))))))
