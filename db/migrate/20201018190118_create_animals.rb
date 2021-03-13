class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.boolean :is_available,      default: true
      t.string :name
      t.string :description
      t.string :espece
      t.string :race
      t.date :birth_date
      t.string :sex
      t.boolean :sterilized,        default: true
      t.string :hair
      t.string :color
      t.string :size
      t.boolean :cat_compatible,    default: true
      t.boolean :dog_compatible,    default: true
      t.boolean :child_compatible,  default: true
      t.boolean :handicap,          default: false
      t.string :contact
      t.date :added_date
      t.string :added_by
      t.string :host_name
      t.integer :price
      t.date :adoption_date

      t.timestamps
    end
  end
end
