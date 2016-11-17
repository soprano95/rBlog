class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :passeword_hash
      t.string :passeword_salt

      t.timestamps
    end
  end
end
