class CreateCancerTypes < ActiveRecord::Migration
  def change
    create_table :cancer_types do |t|
      t.string :name
      t.string :sex
      t.string :location
      t.text :desc

      t.timestamps
    end
  end
end
