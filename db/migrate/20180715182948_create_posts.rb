class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :content
      t.string :tea_id
      t.string :user_id

      t.timestamps
    end
  end
end
