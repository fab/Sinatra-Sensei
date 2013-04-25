class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, :null => false
      t.references :user
      t.references :post
      t.timestamps
    end
  end
end
