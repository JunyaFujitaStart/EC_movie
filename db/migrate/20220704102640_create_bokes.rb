class CreateBokes < ActiveRecord::Migration[6.1]
  def change
    create_table :bokes do |t|
      t.string :boke
      t.string :image_url

      t.timestamps
    end
  end
end
