class CellphoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
 regex = /^\(?\d{2}\)?\s?9\d{4}-?\d{4}$/
if !value.to_s.match?(regex)
 record.errors.add :cellphone, "Adicione um número de telefone válido"
end
  end
end

# ^\(?\d{2}\)?\s?9\d{4}-?\d{4}$
