class AddSwitchScoreToJargonFiles < ActiveRecord::Migration
  def change
    add_column :jargon_files, :switch_score, :float
  end
end
