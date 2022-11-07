class CreatejointableAssemblyPart < ActiveRecord::Migration[6.1]
  def change
      create_table :assemblies_parts, id: false do |t|
      t.references :assembly, unique:true
      t.references :part,unique:true
    end
  end
end