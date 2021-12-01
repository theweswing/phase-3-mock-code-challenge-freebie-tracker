class CreateFreebies < ActiveRecord::Migration[6.1]
  def change
    create_table :freebies do |given|
      given.string :item_name
      given.integer :value
      given.integer :dev_id
      given.integer :company_id
    end
  end
end
