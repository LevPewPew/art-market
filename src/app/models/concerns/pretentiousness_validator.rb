class PretentiousnessValidator < ActiveModel::Validator
  def validate(record)
    if !(/universality|humanity|inhumanity|emotion|invokes|feelings|sense of|unrelenting|consumerist|fetishism|yearning|traditional|post-modern|zeitgeist/.match(record.body))
      record.errors.add( :body, :pretentiousness, message: "Your critique was not pretentious enough." )
    end
  end
end