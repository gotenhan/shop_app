class ChangeOsVersionToString < ActiveRecord::Migration 
  def change
    change_column :phones, :os_version, :string
  end

end
