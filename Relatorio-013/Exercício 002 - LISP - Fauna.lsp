(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)

(defparameter *catalogo*
  (list
   (make-criatura :nome "Peeper"
                  :ambiente "Safe Shallows"
                  :periculosidade "Baixa"
                  :vida-media 5)
   (make-criatura :nome "Reaper Leviathan"
                  :ambiente "Crash Zone"
                  :periculosidade "Alta"
                  :vida-media 100)
   (make-criatura :nome "Ghost Leviathan"
                  :ambiente "Deep"
                  :periculosidade "Alta"
                  :vida-media 200)
   (make-criatura :nome "Crabsquid"
                  :ambiente "Deep"
                  :periculosidade "Media"
                  :vida-media 30)))

(defun filtra-por-perigo (lista-criaturas)
  (remove-if-not
   (lambda (c)
     (not (string-equal (criatura-periculosidade c) "Baixa")))
   lista-criaturas))

(defun relatorio-profundidade (lista-criaturas)
  (let ((apenas-deep
         (remove-if-not
          (lambda (c)
            (string-equal (criatura-ambiente c) "Deep"))
          lista-criaturas)))
    (mapcar
     (lambda (c)
       (format nil "[~a]: Vive em [~a]"
               (criatura-nome c)
               (criatura-ambiente c)))
     apenas-deep)))

(defun executar-testes ()
  (format t "~%--- 1. TESTE: FILTRO DE PERIGO (Nao Baixa) ---~%")
  (let ((perigosos (filtra-por-perigo *catalogo*)))
    (dolist (c perigosos)
      (format t "Criatura: ~a | Nivel: ~a~%"
              (criatura-nome c)
              (criatura-periculosidade c))))

  (format t "~%--- 2. TESTE: RELATORIO DE PROFUNDIDADE (Deep) ---~%")
  (let ((relatorio (relatorio-profundidade *catalogo*)))
    (dolist (linha relatorio)
      (format t "~a~%" linha))))

(executar-testes)