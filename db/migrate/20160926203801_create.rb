class Create < ActiveRecord::Migration[5.0]



  def change
    create_table :products do |t|
      t.string :title
    end
  end
end
