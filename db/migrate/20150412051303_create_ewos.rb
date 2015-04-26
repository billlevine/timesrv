class CreateEwos < ActiveRecord::Migration
  def change
    create_table :ewos do |t|
      t.integer :ewo
      t.string :description
      t.string :department
      t.string :version
      t.string :status
      t.string :type

      t.timestamps
    end
  end
end
