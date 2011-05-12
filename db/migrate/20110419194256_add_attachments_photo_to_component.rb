class AddAttachmentsPhotoTovelociraptor < ActiveRecord::Migration
  def self.up
    add_column :velociraptors, :photo_file_name, :string
    add_column :velociraptors, :photo_content_type, :string
    add_column :velociraptors, :photo_file_size, :integer
    add_column :velociraptors, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :velociraptors, :photo_file_name
    remove_column :velociraptors, :photo_content_type
    remove_column :velociraptors, :photo_file_size
    remove_column :velociraptors, :photo_updated_at
  end
end
