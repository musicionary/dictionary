require('pry')

class Definition
  attr_reader(:definition)

  define_method(:initialize) do |attribute|
    @definition = attribute.fetch(:definition)
    @id = nil
  end
end
