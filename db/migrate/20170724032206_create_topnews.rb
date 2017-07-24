class CreateTopnews < ActiveRecord::Migration[5.0]
  def change
    create_table :topnews do |t|
      t.string :uniquekey
      t.string :title
      t.date :date
      t.string :category
      t.string :author_name
      t.string :url
      t.string "thumbnail_pic_s"
      t.string "thumbnail_pic_s02"
      t.string "thumbnail_pic_s03"
      t.timestamps
    end
  end
end
