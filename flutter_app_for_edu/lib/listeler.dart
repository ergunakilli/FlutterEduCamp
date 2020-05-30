void main() {
  //Fixed length list
  var urunler = new List(5);
  urunler[0] = "Laptop";
  urunler[1] = "Mouse";
  urunler[2] = "Keyboard";
  urunler[3] = "Monitor";
  urunler[4] = "Mic";

  //urunler[5]="Speaker";

  print(urunler);
  print(urunler[2]);
  //print(urunler[5]);

  //Growable List
  var sehirler = ["Ankara", "İstanbul", "İzmir"];
  print(sehirler);
  sehirler.add("Bursa");
  print(sehirler);

  print(sehirler.where((s) => s.contains("a")));

  print(sehirler.first);


//dart list functions

//generic lists

  //type safety
  List<String> sehirler2 = new List<String>(3);
  sehirler2[0] = "Ankara";
  sehirler2[1] = "İstanbul";
  sehirler2[2] = "İzmir";

  print(sehirler2);

  List<String> urunler2 = ["Laptop", "Mouse", "Keyboard"];
  print(urunler2);

  var product1 = Product("TV", 500);
  var product2 = Product("Mikrodalga Fırın", 650);
  List<Product> products = [product1, product2];

  print(products[0].name + " " + products[0].unitPrice.toString());



}
class Product {
  String name;
  double unitPrice;

  Product(String name, double unitPrice) {
    this.name = name;
    this.unitPrice = unitPrice;
  }
}