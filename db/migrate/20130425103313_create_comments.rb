class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, :null => false

      t.timestamps
    end
  end
end
