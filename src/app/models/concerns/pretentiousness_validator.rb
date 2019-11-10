# ********************************************************
# *                      ATTENTION!                      *
# ********************************************************
# This custom validator IS A JOKE, it was made for the
# sake of learning how to do custom validators and
# regex (it can be found in ```/src/app/models/concerns/
# pretentiousness_validator.rb```). I would never
# implement this on a real website.
# ********************************************************
# *                      ATTENTION!                      *
# ********************************************************

class PretentiousnessValidator < ActiveModel::Validator
  def validate(record)
    if !(/universality|humanity|inhumanity|emotion|invokes|feelings|sense of|unrelenting|consumerist|fetishism|yearning|traditional|post-modern|zeitgeist/.match(record.body))
      record.errors.add( :body, :pretentiousness, message: 'Post not create/updated, your critique was not pretentious enough.' )
    end
  end
end