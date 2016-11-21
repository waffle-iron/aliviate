class CreatePosts < ActiveRecord::Migration[5.0]

  def up
    create_table :posts do |t|
      t.string :title, null: false
      t.text :summary, null: false
      t.text :content, null: false
      t.boolean :published, null: false
      t.timestamps
    end
  end

  def down
    drop_table :posts
  end

end
