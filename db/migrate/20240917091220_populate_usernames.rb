class PopulateUsernames < ActiveRecord::Migration[7.2]
  def up
    User.reset_column_information

    User.all.each do |user|
      next unless user.username.nil? || user.username.empty?
      user.update(username: user.email.split("@").first)
    end

    change_column_null :users, :username, false
    add_index :users, :username, unique: true
  end

  def down
    User.reset_column_information

    remove_index :users, :username
    change_column_null :users, :username, true
  end
end
