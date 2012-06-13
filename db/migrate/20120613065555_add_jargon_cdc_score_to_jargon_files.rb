class AddJargonCdcScoreToJargonFiles < ActiveRecord::Migration
  def change
    add_column :jargon_files, :jargonCDC_score, :float
  end
end
