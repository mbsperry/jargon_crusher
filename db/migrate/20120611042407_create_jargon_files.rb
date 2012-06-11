class CreateJargonFiles < ActiveRecord::Migration
  def change
    create_table :jargon_files do |t|
      t.string :name
      t.integer :source_id
      t.float :jargon_score

      t.timestamps
    end
  end
end
