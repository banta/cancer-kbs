class CreateCs < ActiveRecord::Migration
  def change
    create_table :cs do |t|
      t.references :cancer_types
      t.references :cancer_symptoms
      t.timestamps
    end
  end
end
