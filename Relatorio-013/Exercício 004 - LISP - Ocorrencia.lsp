(defstruct ocorrencia
  nome
  ritual
  nivel-medo
  agentes-enviados)

(defun soma-medo-recursiva (lista)
  (if (null lista)
      0
      (+ (ocorrencia-nivel-medo (car lista))
         (soma-medo-recursiva (cdr lista)))))

(defun analise-final (lista-ocorrencias)
  (let* ((total-medo (soma-medo-recursiva lista-ocorrencias))
         (qtd (length lista-ocorrencias))
         (media (if (> qtd 0) (/ total-medo qtd) 0))
         
         (criticas 
          (remove-if-not 
           (lambda (obs)
             (and (> (ocorrencia-agentes-enviados obs) 3)
                  (> (ocorrencia-nivel-medo obs) media)))
           lista-ocorrencias)))
    
    (mapcar #'ocorrencia-nome criticas)))

(defparameter *arquivo-x*
  (list
   (make-ocorrencia :nome "Sinais do Outro Lado" 
                    :ritual "Invocacao" 
                    :nivel-medo 80 
                    :agentes-enviados 5)
   
   (make-ocorrencia :nome "O Segredo na Floresta" 
                    :ritual "Transmutacao" 
                    :nivel-medo 40 
                    :agentes-enviados 4)
   
   (make-ocorrencia :nome "Desconjuracao" 
                    :ritual "Conhecimento" 
                    :nivel-medo 90 
                    :agentes-enviados 2)
   
   (make-ocorrencia :nome "Calamidade" 
                    :ritual "Energia" 
                    :nivel-medo 85 
                    :agentes-enviados 6)))

(defun executar-analise ()
  (format t "~%--- ANALISE DA ORDEM ---~%")
  (let ((total (soma-medo-recursiva *arquivo-x*))
        (nomes-criticos (analise-final *arquivo-x*)))
    
    (format t "Soma Total de Medo (Recursiva): ~d~%" total)
    (format t "Media de Medo Calculada: ~f~%" (/ total (length *arquivo-x*)))
    (format t "~%MISSOES CRITICAS (Agentes > 3 e Medo > Media):~%")
    
    (dolist (nome nomes-criticos)
      (format t "- ~a~%" nome))))

(executar-analise)