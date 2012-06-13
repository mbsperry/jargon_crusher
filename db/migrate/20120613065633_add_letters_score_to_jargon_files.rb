class AddLettersScoreToJargonFiles < ActiveRecord::Migration
  def change
    add_column :jargon_files, :letters_score, :float
  end
end
