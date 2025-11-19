(defstruct item
  nome
  tipo
  preco
  forca-magica)

(defparameter *catalogo*
  (list
   (make-item :nome "Lamina do Caos" :tipo "Arma" :preco 500 :forca-magica 95)
   (make-item :nome "Elixir da Vida" :tipo "Pocao" :preco 100 :forca-magica 50)
   (make-item :nome "Anel do Esquecimento" :tipo "Artefato" :preco 1200 :forca-magica 150)
   (make-item :nome "Adaga Enferrujada" :tipo "Arma" :preco 50 :forca-magica 40)))

(defun adiciona-imposto (preco)
  "Aumenta o preco em 15%"
  (* preco 1.15))

(defun bonus-maldicao (forca)
  "Retorna forca * 1.5 se forca > 80, senao retorna a forca original"
  (if (> forca 80)
      (* forca 1.5)
      forca))

(defun processa-venda (catalogo)
  (let* ((apenas-armas
          (remove-if-not 
           (lambda (i) (string-equal (item-tipo i) "Arma")) 
           catalogo))
         
         (armas-taxadas
          (mapcar 
           (lambda (i)
             (make-item 
              :nome (item-nome i)
              :tipo (item-tipo i)
              :preco (adiciona-imposto (item-preco i)) 
              :forca-magica (item-forca-magica i)))
           apenas-armas))
         
         (relatorio-final
          (mapcar 
           (lambda (i)
             (list (item-nome i) 
                   (bonus-maldicao (item-forca-magica i))))
           armas-taxadas)))
    
    relatorio-final))

(defun executar-loja ()
  (format t "~%--- LOJA CLANDESTINA: PROCESSAMENTO ---~%")
  (let ((resultado (processa-venda *catalogo*)))
    (dolist (linha resultado)
      (format t "Arma: ~a | Poder Maldito Final: ~d~%" 
              (first linha) 
              (second linha)))))

(executar-loja)