class CreatePublications < ActiveRecord::Migration[7.1]
  def change
    create_table :publications do |t|
      t.string :title
      t.text :content
      t.references :user, foreign_key: true
      t.belongs_to :city, index: true

      t.timestamps
    end
  end
end
