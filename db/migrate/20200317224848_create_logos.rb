class CreateLogos < ActiveRecord::Migration[6.0]
  def change
    create_table :logos do |t|
      t.string :name
      t.company :belongs_to

      t.timestamps
    end
  end
end
