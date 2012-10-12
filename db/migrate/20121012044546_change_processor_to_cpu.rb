class ChangeProcessorToCpu < ActiveRecord::Migration 
  def change
    rename_column :phones, :processor, :cpu
  end

end
