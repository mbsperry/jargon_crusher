class AddAttachmentTextFileToJargonFiles < ActiveRecord::Migration
  def self.up
    add_column :jargon_files, :text_file_file_name, :string
    add_column :jargon_files, :text_file_content_type, :string
    add_column :jargon_files, :text_file_file_size, :integer
    add_column :jargon_files, :text_file_updated_at, :datetime
  end

  def self.down
    remove_column :jargon_files, :text_file_file_name
    remove_column :jargon_files, :text_file_content_type
    remove_column :jargon_files, :text_file_file_size
    remove_column :jargon_files, :text_file_updated_at
  end
end
