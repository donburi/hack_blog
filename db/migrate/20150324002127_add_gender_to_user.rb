class AddGenderToUser < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string

    User.find_each do |user|
    	user.update_column(:gender, 'f') 
    end

  end
end
