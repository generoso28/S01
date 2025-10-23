class Drink
  def initialize(nome, preco_base)
    @_nome = nome
    self.preco_base = preco_base
  end

  def nome
    @_nome
  end

  def preco_base
    @_preco_base
  end

  def preco_base=(valor)
    if valor <= 0
      raise ArgumentError, "O preço base deve ser positivo!"
    end
    @_preco_base = valor
  end

  def to_s
    "Drink: #{@_nome}, Preço Base: $#{@_preco_base}"
  end
end

class DrinkLenda < Drink
  attr_reader :anos_desde_criacao

  def initialize(nome, preco_base, anos_desde_criacao)
    super(nome, preco_base)
    @anos_desde_criacao = anos_desde_criacao
  end

  def preco_final
    preco_base + (@anos_desde_criacao * 5)
  end

  def to_s
    "DrinkLenda: #{@_nome}, Preço Base: $#{preco_base}, Anos: #{@anos_desde_criacao}, Preço Final: $#{preco_final}"
  end
end

puts "===== Bar AfterLife ====="
puts "Cadastro de Drink Lendário"
puts

print "Digite o nome do drink: "
nome = gets.chomp

print "Digite o preço base do drink: $"
preco_base = gets.chomp.to_f

print "Digite quantos anos desde a criação do drink: "
anos = gets.chomp.to_i

puts

begin
  drink_lenda = DrinkLenda.new(nome, preco_base, anos)
  puts drink_lenda
rescue ArgumentError => e
  puts "Erro: #{e.message}"
end