class ProfanityValidator < ActiveModel::Validator
  def validate(record)
    if record.body == "fuck"
      record.errors.add( :body, :profanity, message: "don't swear lol" )
    end
  end
end