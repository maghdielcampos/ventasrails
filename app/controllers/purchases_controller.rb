class PurchasesController < ApplicationController
  def new
  end

  def index
    @purchases = Purchase.all
    @total = 0;
    @purchases.each do |purchase|
      @total += purchase.precio_del_item * purchase.total_de_items
    end
    if @total >= 1000000
      @total = (@total / 1000000.0).round(2), " millones"
    elsif @total >= 1000
      @total = (@total / 1000.0).round(2), " miles"
    else
      @total = @total.round(2)
    end

  end

  def create
    file = params[:file]
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      Purchase.create!(comprador: row["Cliente"], descripcion_del_item: row["Descripcion del Producto"], precio_del_item: row["Precio por pieza"], total_de_items: row["Numero de piezas"], direccion_de_vendedor: row["Diección del vendedor"], vendedor: row["Nombre del Vendedor"])
    end
    redirect_to purchases_path, notice: "Datos importados."
  end
end

