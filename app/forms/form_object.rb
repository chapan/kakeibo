class FormObject
  include ActiveModel::Model

  def assign_attributes(values)
    values.each do |k, v|
      send("#{k}=", v)
    end
  end

end