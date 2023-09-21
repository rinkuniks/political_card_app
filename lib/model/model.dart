class ItemDetaill12 {
  int ProductID;
  String productName;
  String designno;
  String brands;
  String groupcode;

  String groupsize;
  String barcode;
  String size;
  String colour;
  double quantity;

  double saleRate;
  String Tradediscount;
  String GroupcodeSeries;
  String Brandid;
  String Category;

  String Categoryid;
  String HSN;
  String Unit;
  String Unitid;
  double NetQty;

  double EffectiveRate;
  String GST;
  String GSTid;
  String GroupName;
  String Groupid;

  String SubGroup;
  String SubGroupid;
  String SubCategory;
  String SubCategoryid;
  String Colorid;

  String Sizeid;
  double Mrp;
  double Wsp;
  String GroupBarcode;

  ItemDetaill12({
    required this.ProductID,
    required this.productName,
    required this.designno,
    required this.brands,
    required this.groupcode,
    required this.groupsize,
    required this.barcode,
    required this.size,
    required this.colour,
    required this.quantity,
    required this.saleRate,
    required this.Tradediscount,
    required this.GroupcodeSeries,
    required this.Brandid,
    required this.Category,
    required this.Categoryid,
    required this.HSN,
    required this.Unit,
    required this.Unitid,
    required this.NetQty,
    required this.EffectiveRate,
    required this.GST,
    required this.GSTid,
    required this.GroupName,
    required this.Groupid,
    required this.SubGroup,
    required this.SubGroupid,
    required this.SubCategory,
    required this.SubCategoryid,
    required this.Colorid,
    required this.Sizeid,
    required this.Mrp,
    required this.Wsp,
    required this.GroupBarcode,
  });
  factory ItemDetaill12.fromJson(Map<String, dynamic> json) {
    return ItemDetaill12(
      ProductID: int.parse(json['ProductID'].toString()),
      productName: json['ProductName'] as String,
      designno: json['Designno'] as String,
      brands: json['Brands'] as String,
      groupcode: json['Groupcode'] as String,
      groupsize: json['GroupSize'] as String,
      barcode: json['Barcode'] as String,
      size: json['Size'] as String,
      colour: json['Colour'] as String,
      quantity: double.parse(json['UnitQty'].toString()),
      saleRate: double.parse(json['SaleRate'].toString()),
      Tradediscount: json['DiscSale'] as String,
      GroupcodeSeries: json['BarcodeSeries'] as String,
      Brandid: json['Makeid'] as String,
      Category: json['Category'] as String,
      Categoryid: json['Categoryid'] as String,
      HSN: json['Hsn'] as String,
      Unit: json['Unit'] as String,
      Unitid: json['Unitid'] as String,
      NetQty: double.parse(json['UnitQty'].toString()),
      EffectiveRate: double.parse(json['SaleRate'].toString()),
      GST: json['GST'] as String,
      GSTid: json['GSTID'] as String,
      GroupName: json['GroupName'] as String,
      Groupid: json['Groupid'] as String,
      SubGroup: json['SubGroup'] as String,
      SubGroupid: json['SubGroupid'] as String,
      SubCategory: json['SubCategory'] as String,
      SubCategoryid: json['SubCategoryid'] as String,
      Colorid: json['Colorid'] as String,
      Sizeid: json['Sizeid'] as String,
      Mrp: double.parse(json['Mrp'].toString()),
      Wsp: double.parse(json['WSP'].toString()),
      GroupBarcode: json['GroupBarcode'] as String,
    );
  }

  int compareTo(ItemDetaill12 other) =>
      productName.compareTo(other.productName);
}