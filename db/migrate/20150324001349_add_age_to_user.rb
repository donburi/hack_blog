class AddAgeToUser < ActiveRecord::Migration
  def up
    add_column :users, :age, :integer

    User.find_each do |user|
      random_age = (rand * 100).round
      user.update_column(:age, random_age)
    end
  end

  def down
    remove_column :users, :age
  end
end
