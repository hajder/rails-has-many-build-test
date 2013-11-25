class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.belongs_to :parent

      t.timestamps
    end
  end
end
