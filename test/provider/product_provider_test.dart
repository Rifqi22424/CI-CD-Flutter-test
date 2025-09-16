import 'package:flutter_test/flutter_test.dart';
import 'package:learn_testing/model/product.dart';
import 'package:learn_testing/provider/product_provider.dart';

void main() {
  group("Product Provider", () {
    test(
      "when try to load products it should returns all the products",
      () async {
        // arrage
        final ProductProvider productProvider = ProductProvider();

        // act
        final future = productProvider.loadProducts();
        expect(productProvider.isLoading, true);

        await future;
        expect(productProvider.isLoading, false);

        // assert
        expect(productProvider.products.length, 3);
        expect(productProvider.products[0].name, "Ayam");
      },
    );

    test(
      'when try to add product it should added to the products list',
      () async {
        final ProductProvider productProvider = ProductProvider();

        productProvider.setProducts([
          Product(id: 1, name: "Computer"),
          Product(id: 2, name: "Handphone"),
        ]);

        final newProductName = "Tablet";

        final future = productProvider.addProduct(newProductName);
        expect(productProvider.isLoading, true);

        await future;
        expect(productProvider.isLoading, false);

        expect(productProvider.products.length, 3);
        expect(productProvider.findByName(newProductName), isNotNull);
      },
    );

    test(
      'when try to edit the product it should be edited and change it\'s name',
      () async {
        final ProductProvider productProvider = ProductProvider();

        productProvider.setProducts([
          Product(id: 1, name: "Computer"),
          Product(id: 2, name: "Handphone"),
        ]);

        final id = 1;
        final newName = "Tissue";

        final future = productProvider.editProduct(id, newName);
        expect(productProvider.isLoading, true);

        await future;
        expect(productProvider.isLoading, false);

        expect(productProvider.products.any((p) => p.name == newName), true);
        expect(
          productProvider.products.any((p) => p.name == "Computer"),
          false,
        );
        expect(productProvider.products.length, 2);
      },
    );

    test(
      'when try to remove a product by id it should be remove the product',
      () async {
        final ProductProvider productProvider = ProductProvider();

        productProvider.setProducts([
          Product(id: 1, name: "Computer"),
          Product(id: 2, name: "Handphone"),
        ]);

        final future = productProvider.deleteProduct(1);
        expect(productProvider.isLoading, true);

        await future;
        expect(productProvider.isLoading, false);

        expect(
          productProvider.products.any((p) => p.name == "Computer"),
          false,
        );
        expect(productProvider.products.length, 1);
      },
    );
  });
}
