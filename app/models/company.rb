class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  def give_freebie(dev, item_name, value)
    new_item = Freebie.create(item_name: item_name, value: value)
    dev.freebies << new_item
    self.freebies << new_item
  end

  def self.oldest_company
    oldest_year = self.minimum(:founding_year)
    self.find_by(founding_year: oldest_year)
  end
end
