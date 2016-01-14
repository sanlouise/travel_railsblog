class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :city
      t.string :country
      t.text :description

    end
  end
end
