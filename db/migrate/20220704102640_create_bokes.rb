class CreateBokes < ActiveRecord::Migration[6.1]
  def change
    create_table :bokes do |t|
      t.string :boke
      t.string :image_url

      t.timestamps TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      t.created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    end
  end
end
