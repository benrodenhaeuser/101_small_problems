class Employee
  def initialize(name, serial)
    @name = name
    @serial = serial
    @type = nil
    @employment = nil
    @vacation = nil
    @desk = nil
  end

  def to_s
    <<-TEXT
      Name: #{@name}
      Type: #{@type}
      Serial Number: #{@serial}
      Vacation Days: #{@vacation}
      Desk: #{@desk}
    TEXT
  end

end

class FullTimeEmployee < Employee

  def initialize(name, serial)
    super(name, serial)
    @employment = "Full Time"
  end

  def take_vacation
    # omitted implementation
  end
end

module Delegatable
  def delegate
    # omitted implementation
  end
end

class Executive < FullTimeEmployee
  include Delegatable

  def initialize(name, serial)
    super(name, serial)
    @vacation = 20
    @desk = "Corner Office"
    @type = "Executive"
  end
end

class Manager < FullTimeEmployee
  include Delegatable

  def initialize(name, serial)
    super(name, serial)
    @vacation = 14
    @desk = "Regular Office"
    @type = "Manager"
  end
end

class RegularEmployee < FullTimeEmployee
  def initialize(name, serial)
    super(name, serial)
    @vacation = 10
    @desk = "Cubicle"
    @type = "Regular Employee"
  end
end

class PartTimeEmployee < Employee

  def initialize(name, serial)
    super(name, serial)
    @employment = "Part Time"
    @vacation = 0
    @desk = "Open Workspace"
    @type = "Part Time Employee"
  end
end
