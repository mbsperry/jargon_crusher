class AddCompositeScoreToJargonFiles < ActiveRecord::Migration
  def change
    add_column :jargon_files, :composite_score, :float
  end
end
