class User < ApplicationRecord
  # Antes de validar los campos convertimos los parametros a Mayusculas
  before_validation :upcase_fields

  # Posibles
  @position = ['EJECUTIVO PERSONAS', 'AGENTE I', 'AGENTE I',
                'AGENTE II', 'EJECUTIVO SELECT', 'GESTOR COMERCIAL SENIOR',
                'EJECUTIVO PYME']

  @area = ['ZONA SUR', 'ZONA NORTE', 'ZONA CENTRO']

  @world = ['SANTANDER', 'BANEFE', 'BANCO Y FILIALES']

  # Validamos los parametros
  validates :position, inclusion: { in: @position,
    message: "Debe seleccionar uno de los siguientes cargos #{ @position }" }

  validates :area, inclusion: { in: @area,
    message: "Debe seleccionar uno de los siguientes areas #{ @area }" }

  validates :world, inclusion: { in: @world,
    message: "Debe seleccionar uno de los siguientes mundos #{ @world }" }

  def upcase_fields
    self.name.upcase!
    self.position.upcase!
    self.area.upcase!
    self.world.upcase!
  end
  
end
