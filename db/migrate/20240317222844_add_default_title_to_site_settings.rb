class AddDefaultTitleToSiteSettings < ActiveRecord::Migration[7.0]
  def up
    change_column_default :site_settings, :title, from: nil, to: "E-Library"
    change_column_null :site_settings, :title, false
  end

  def down
    change_column_default :site_settings, :title, from: "E-Library", to: nil
    change_column_null :site_settings, :title, true
  end
end
