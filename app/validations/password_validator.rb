class PasswordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
     regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$*&@#])[0-9a-zA-Z$*&@#]{8,}$/

     if !value.match?(regex)
      record.errors.add :password, "Sua senha deve incluir, no minimo, 1 número, 1 caracter especial, letra minúscula e maiúscula"
     end
  end
end
