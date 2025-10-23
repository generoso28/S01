class MicroondasUnidade
  def initialize(serial_number)
    @serial_number = serial_number
    puts "(Unidade de Microondas '#{@serial_number}' inicializada e acoplada.)"
  end

  def aquecer_por(segundos)
    puts "BEEP! Aquecendo por #{segundos}s... Enviando dados para a linha do tempo..."
    sleep(0.5)
  end
end

class DMail
  attr_reader :conteudo, :hora_envio

  def initialize(conteudo, hora_envio)
    @conteudo = conteudo
    @hora_envio = hora_envio
  end

  def to_s
    "[#{@hora_envio}] - #{@conteudo}"
  end
end
class TelefoneDeMicroondas

  def initialize(nome_usuario)
    @nome_usuario = nome_usuario
    @unidade = MicroondasUnidade.new("CERN-Prototype-v2")

    @dmails_enviados = []
  end

  def enviar_dmail
    puts "\n--- Novo D-Mail (Enviador: #{@nome_usuario}) ---"

    print "Digite o conteúdo da mensagem: "
    conteudo = gets.chomp

    print "Digite a hora de envio (formato HH:MM, ex: 14:35): "
    hora = gets.chomp

    puts "Ativando unidade interna..."
    @unidade.aquecer_por(15)
    novo_dmail = DMail.new(conteudo, hora)

    @dmails_enviados << novo_dmail

    puts "D-Mail enviado com sucesso! (para as #{hora})"
  end

  def listar_dmails_apos(horario_corte)
    puts "\nBuscando D-Mails enviados após as #{horario_corte}..."
    dmails_filtrados = @dmails_enviados.select do |dmail|
      dmail.hora_envio > horario_corte
    end

    return dmails_filtrados
  end
  def simular_envio_previo(conteudo, hora)
    @dmails_enviados << DMail.new(conteudo, hora)
  end
end

puts "Telefone de Microondas (Lab Member 001) ativado."
telefone = TelefoneDeMicroondas.new("Okabe Rintarou")

telefone.simular_envio_previo("A reunião é às 11:00.", "10:15")
telefone.simular_envio_previo("Não compre o IBN 5100!", "13:45")
telefone.simular_envio_previo("Mayuri está em perigo.", "15:02")

telefone.enviar_dmail
telefone.enviar_dmail

puts "\n--- Filtro de D-Mails ---"
print "Ver D-Mails enviados após qual horário? (HH:MM): "
corte = gets.chomp

dmails_recentes = telefone.listar_dmails_apos(corte)

if dmails_recentes.empty?
  puts "Nenhum D-Mail encontrado após as #{corte}."
else
  puts "\n--- D-Mails Encontrados ---"
  dmails_recentes.each do |dmail|
    puts dmail
  end
end