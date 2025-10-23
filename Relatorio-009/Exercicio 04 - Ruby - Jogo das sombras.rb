module Rastreavel
  def obter_localizacao(hora)
    raise NotImplementedError, 
          "#{self.class} incluiu Rastreavel, mas não implementou 'obter_localizacao'"
  end
end

module Perigoso
  def calcular_risco
    raise NotImplementedError, 
          "#{self.class} incluiu Perigoso, mas não implementou 'calcular_risco'"
  end
end

class Participante
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end

  def to_s
    @nome
  end
end

class Detetive < Participante
  include Rastreavel

  attr_accessor :localizacao_atual

  def initialize(nome)
    super(nome)
    @localizacao_atual = "Desconhecida"
  end

  def obter_localizacao(hora)
    "Às #{hora}, '#{@nome}' estava em '#{@localizacao_atual}'."
  end
end

class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso
  attr_accessor :localizacao_atual

  def initialize(nome)
    super(nome)
    @localizacao_atual = "Escondido"
  end
  def obter_localizacao(hora)
    "Às #{hora}, '#{@nome}' foi detectado perto de '#{@localizacao_atual}' (Sinal fraco)."
  end
  def calcular_risco
    "Risco Nível: 10 (Extremo)"
  end
end
class Cenario
  def initialize(participantes)
    @participantes = participantes
    puts "[Cenário 'O Jogo das Sombras' iniciado com #{@participantes.length} participantes.]"
  end

  def identificar_ameacas
    puts "\n[Sistema] Verificando assinaturas de Módulos Perigosos..."
    ameacas = @participantes.select do |participante|
      participante.respond_to?(:calcular_risco)
    end
    return ameacas
  end
  def rastrear_participantes(hora)
    puts "\n[Sistema] Rastreando todas as unidades às #{hora}..."
    @participantes.each do |p|
      if p.respond_to?(:obter_localizacao)
        puts p.obter_localizacao(hora)
      else
        puts "'#{p.nome}' não possui módulo de rastreio."
      end
    end
  end
end

puts "Carregando participantes..."
sherlock = Detetive.new("Sherlock Holmes")
moriarty = MestreDoCrime.new("Professor Moriarty")
watson = Detetive.new("Dr. Watson")
print "Defina a localização de Sherlock (ex: 221B Baker St): "
sherlock.localizacao_atual = gets.chomp

print "Defina a localização de Moriarty (ex: Reichenbach): "
moriarty.localizacao_atual = gets.chomp

lista_de_participantes = [sherlock, moriarty, watson]

# Crie o Cenario
jogo_londres = Cenario.new(lista_de_participantes)

jogo_londres.rastrear_participantes("14:30")

ameacas_encontradas = jogo_londres.identificar_ameacas

puts "\n--- RELATÓRIO DE AMEAÇAS ---"
if ameacas_encontradas.empty?
  puts "Nenhuma ameaça detectada no cenário."
else
  ameacas_encontradas.each do |ameaca|
    puts "ALVO: #{ameaca.to_s} | STATUS: #{ameaca.calcular_risco}"
  end
end