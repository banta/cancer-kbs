class CreateCancerSymptoms < ActiveRecord::Migration
  def change
    create_table :cancer_symptoms do |t|
      t.string :name
      t.text :desc

      t.timestamps
    end
  end
end
