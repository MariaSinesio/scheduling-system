class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
   regex = /\d{3}\.?\d{3}\.?\d{3}-?\d{2}/ # Coloca-se // Para fechar o regex

   if !value.to_s.match?(regex)
     record.errors.add(:cpf, "Adicione um cpf válido.")
   end

   digits = value.chars.map(&:to_i)

sum = digits[0..8].each_with_index.sum do |num, i|
  num * (10 - i)
end

rest = sum % 11
penult = rest < 2 ? 0 : 11 - rest

# 2º dígito verificador
sum = digits[0..8].each_with_index.sum do |num, i|
  num * (11 - i)
end + penult * 2

rest = sum % 11
last_num = rest < 2 ? 0 : 11 - rest

unless penult == digits[9] && last_num == digits[10]
      record.errors.add(:cpf, "Adicione um cpf com verificadores válidos.")
end
  end
end

# /\d{3}\.?\d{3}\.?\d{3}-?\d{2}/
# 197.672.127-01
