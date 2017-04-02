require "administrate/field/base"

class SelectField < Administrate::Field::Base
  def to_s
    data
  end
end
