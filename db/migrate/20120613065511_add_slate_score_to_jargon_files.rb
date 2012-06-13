class AddSlateScoreToJargonFiles < ActiveRecord::Migration
  def change
    add_column :jargon_files, :slate_score, :float
  end
end
