class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|

      t.timestamps
    end
  end
end
