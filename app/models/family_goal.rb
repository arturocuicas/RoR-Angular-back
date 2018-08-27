class FamilyGoal < ApplicationRecord
  # Antes de validar los campos convertimos los parametros a Mayusculas
  before_validation :upcase_fields

  # Creamos los campos permitidos para la Familia de Metas
  @name = [
    'EJECUTIVO PERSONAS', 'AGENTE', 'JEFE OPERACIONES',
    'EJECUTIVO SELECT', 'GESTOR COMERCIAL SENIOR', 'EJECUTIVO PYME'
  ]

  @position = [
    'EJECUTIVO PERSONAS', 'AGENTE I', 'AGENTE I', 'AGENTE II',
    'EJECUTIVO SELECT', 'GESTOR COMERCIAL SENIOR', 'EJECUTIVO PYME'
  ]

  @area = [
    'ZONA SUR', 'ZONA NORTE', 'ZONA CENTRO'
  ]

  @world = [
    'SANTANDER', 'BANEFE', 'BANCO Y FILIALES'
  ]

  validate :family_exist
  # Validamos los parametros
  validates :name, inclusion: { in: @name,
    message: "Debe seleccionar uno de los siguientes nombres #{ @name }" }

  validates :position, inclusion: { in: @position,
    message: "Debe seleccionar uno de los siguientes cargos #{ @position }" }

  validates :area, inclusion: { in: @area,
    message: "Debe seleccionar uno de los siguientes areas #{ @area }" }

  validates :world, inclusion: { in: @world,
    message: "Debe seleccionar uno de los siguientes mundos #{ @world }" }

  # Convertimos los parametros en Mayusculas
  def upcase_fields
    self.name.upcase!
    self.position.upcase!
    self.area.upcase!
    self.world.upcase!
  end

  # Verificamos que no exista una Familia con los mismos parametros
  def family_exist
    if(FamilyGoal.exists?(name: self.name, position: self.position,
                            area: self.area, world: self.world))
      errors.add(:error, 'Ya existe una Familia de Metas con eso Parametros')
    end
  end
end
