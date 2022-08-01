class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :Freebies

  def received_one?(item_name)
    if self.freebies.find_by(item_name: item_name)
      true
    else
      false
    end
  end

  def give_away(dev, freebie)
    if self.freebies.find_by(id: freebie.id)
      freebie.dev_id = dev.id
      freebie.save
    else
      false
    end
  end
end
