class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    names = self.freebies.collect { |given_freebie| given_freebie[:item_name] }
    names.include?(item_name)
  end

  def give_away(dev, freebie)
    if self.received_one?(freebie[:item_name]) == true
      found = self.freebies.find_by(item_name: freebie.item_name)
      dev.freebies << found
    end
  end
end
