class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :comment
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :movies, [:user_id, :created_at]
  end
end
