class CreateImageFiles < ActiveRecord::Migration[6.1]
  def change
    create_table :image_files do |t|
      t.string :title
      t.string :file
      t.string :content

      t.timestamps TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      t.created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    end
  end
end
