class AddImageKlass < ActiveRecord::Migration[6.0]
  def change
    add_column :klasses, :image_url, :string
  end
end
