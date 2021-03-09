require 'active_record'

def persisted_data(relevant_class:, id:)
  result = relevant_class.find_by(id: id)
end
