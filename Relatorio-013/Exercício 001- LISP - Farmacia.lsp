(defun calcula-dosagem (peso-kg idade-anos)
  (cond
    ((or (< idade-anos 5) (< peso-kg 20)) 10)
    ((and (<= 5 idade-anos 12) (>= peso-kg 20)) 25)
    (t 50)))

(defun ajusta-preco (preco-base nome-da-erva)
  (cond
    ((string-equal nome-da-erva "Ginseng") (* preco-base 3.0))
    ((string-equal nome-da-erva "Lotus") (* preco-base 1.5))
    (t preco-base)))

(defun executar-testes ()
  (print "--- CASO SOLICITADO ---")
  (let ((dose (calcula-dosagem 60 14))
        (preco (ajusta-preco 10 "Lotus")))
    (format t "~%Paciente (14 anos, 60kg) - Lotus (Base 10)")
    (format t "~%Dosagem: ~d ml" dose)
    (format t "~%Preco Final: ~f" preco))

  (print "--- OUTROS TESTES ---")
  (format t "~%Ginseng (3 anos, 12kg): Dose ~d ml | Preco ~f"
          (calcula-dosagem 12 3) (ajusta-preco 10 "Ginseng"))
  (format t "~%Hortela (10 anos, 30kg): Dose ~d ml | Preco ~f"
          (calcula-dosagem 30 10) (ajusta-preco 5 "Hortela")))

(executar-testes)