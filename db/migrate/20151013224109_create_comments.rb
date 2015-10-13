class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :description, :string
      t.column :author, :string
      t.column :point, :integer

      t.timestamps
    end
  end
end
