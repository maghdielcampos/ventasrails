class PurchasesController < ApplicationController
  def new
  end

  # def create
  #   # file = params[:file_upload][:file]
  #   # File.open(Rails.root.join('public', 'uploads', file.original_filename), 'wb') do |f|
  #   #   f.write(file.read)
  #   # end
  #
  #   file = Roo::Excelx.new(Rails.root.join('public', 'uploads', file.original_filename))
  #   2.upto(file.last_row) do |line|
  #     comprador = file.cell(line, 'A')
  #     descripcion_del_item = file.cell(line, 'B')
  #     precio_del_item = file.cell(line, 'C')
  #     total_de_items = file.cell(line, 'D')
  #     direccion_del_vendedor = file.cell(line, 'E')
  #     vendedor = file.cell(line, 'F')
  #
  #     Purchase.create!(comprador: comprador, descripcion_del_item: descripcion_del_item, precio_del_item: precio_del_item, total_de_items: total_de_items, direccion_del_vendedor: direccion_del_vendedor, vendedor: vendedor)
  #   end
  #
  #   redirect_to root_path, notice: "purchases imported."
  # end
  def create
    file = params[:file]
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      Purchase.create!(comprador: row["Cliente"], descripcion_del_item: row["Descripción del Producto"], precio_del_item: row["Precio por pieza"], total_de_items: row["Numero de piezas"], direccion_de_vendedor: row["Diección del vendedor"], vendedor: row["Nombre del Vendedor"])
    end
    redirect_to root_path, notice: "purchases imported."
  end
end

