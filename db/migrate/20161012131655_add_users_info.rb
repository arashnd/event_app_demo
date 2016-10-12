class AddUsersInfo < ActiveRecord::Migration


  def change

    colums = { username: :string, first_name: :string, last_name: :string, company: :string }

    colums.each do |name, type|
      add_column :users, name, type
    end
    add_index :users, :username
  end

end
