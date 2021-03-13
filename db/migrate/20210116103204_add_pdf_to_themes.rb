class AddPdfToThemes < ActiveRecord::Migration[6.1]
  def change
    add_column :themes, :pdf, :string
  end
end
