class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :photo
      t.string :photo1
      t.string :photo2
      t.integer :user_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
