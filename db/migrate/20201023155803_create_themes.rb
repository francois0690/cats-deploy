class CreateThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :themes do |t|
      t.string :name
      t.string :basic_description
      t.string :full_description
      t.string :email
      t.string :phone
      t.string :address
      t.string :legal_mention
      t.string :siret_number
      t.string :twitter_url
      t.string :facebook_url
      t.string :instagram_url
      t.string :background_color

      t.timestamps
    end
  end
end
