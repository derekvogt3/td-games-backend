class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :image_url
      t.string :description, default: "Coming Soon!"
      t.timestamps
    end
  end
end
