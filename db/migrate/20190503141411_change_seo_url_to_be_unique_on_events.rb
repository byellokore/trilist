class ChangeSeoUrlToBeUniqueOnEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :seo_url, :string, unique: true
  end
end
