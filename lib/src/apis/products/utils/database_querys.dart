abstract class DatabaseQuerys {
  static const getProductById =
      ''' SELECT productid, title, cid, price, description, images, "size"
                                    FROM "AppProducts" 
                                    WHERE productid = @productid; ''';
  static const getCategoriesQuery =
      ''' SELECT categoryid, title, iconimage FROM public."AppCategories"; ''';
  static const getProductsQuery =
      ''' SELECT productid, title, price, description, images, cid, size FROM public."AppProducts"; ''';
  static const createProductsQuery =
      ''' INSERT INTO "AppProducts"(productid, title, price, description, images, size) VALUES (@productid, @title, @price, @description, @images, @size) RETURNING productid, title, price, description, images, size; ''';
  static const createCategoryQuery =
      '''INSERT INTO "AppCategories" (categoryid, title, iconimage, products)
        VALUES(@categoryid, @title, @iconimage, @products)
        RETURNING categoryid, title, iconimage, products;
        ''';
}
