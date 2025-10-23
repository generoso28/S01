class Musico
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(peca)
    raise NotImplementedError,
          "A classe filha '#{self.class}' deve implementar o método 'tocar_partitura'"
  end

  def to_s
    "#{@nome} (#{@instrumento})"
  end
end

class Pianista < Musico
  def initialize(nome)
    super(nome, 'Piano')
  end

  def tocar_partitura(peca)
    puts "#{nome} (Piano) lê a partitura e pressiona as teclas para tocar '#{peca}'."
  end
end

class Violinista < Musico
  def initialize(nome)
    super(nome, 'Violino')
  end

  def tocar_partitura(peca)
    puts "#{nome} (Violino) posiciona o arco e dedilha as cordas para tocar '#{peca}'."
  end
end

class Maestro
  attr_reader :nome, :musicos

  def initialize(nome, musicos)
    @nome = nome
    @musicos = musicos
  end

  def iniciar_ensaio(peca)
    puts "\n--- O Ensaio Começou (Maestro: #{@nome}) ---"
    puts "Maestro: 'Atenção! Vamos tocar: #{peca}'"

    @musicos.each do |musico|
      musico.tocar_partitura(peca)
    end
    puts '--- Fim do Ensaio ---'
  end

  def mudar_foco(estado)
    puts "\nMaestro: 'Quero todos #{estado} agora!'"

    @musicos.map do |musico|
      "#{musico.nome} agora está #{estado}!"
    end
  end
end

kousei = Pianista.new('Kousei Arima')
kaori = Violinista.new('Kaori Miyazono')
ryota = Violinista.new('Ryota Watari')

orquestra = [kousei, kaori, ryota]

maestro_hiroko = Maestro.new('Hiroko Seto', orquestra)

print 'Maestro: Qual peça vamos ensaiar hoje? '
peca_para_ensaio = gets.chomp

maestro_hiroko.iniciar_ensaio(peca_para_ensaio)

status_orquestra = maestro_hiroko.mudar_foco('Concentrado')

puts "\n--- Status Atual da Orquestra ---"
puts status_orquestra