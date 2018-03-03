class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.st_point :lonlat, geographic: true
      t.belongs_to :user
    end
  end
end
