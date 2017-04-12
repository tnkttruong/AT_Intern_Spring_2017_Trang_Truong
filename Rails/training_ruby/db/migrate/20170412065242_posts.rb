class Posts < ActiveRecord::Migration[5.0]
  def change
     create_table :posts do |t|
      t.string :first_name
      t.string :last_name
    end
  end
end
