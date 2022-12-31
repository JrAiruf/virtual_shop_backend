abstract class DatabaseQuerys {
  static const getProductById =
      ''' SELECT productid, title, cid, price, description, images, "size"
          FROM "AppProducts" 
          WHERE productid = @productid; ''';
  static const getCategoryById =
      ''' SELECT *
          FROM "AppCategories" 
          WHERE categoryid = @categoryid ''';
  static const getCategoriesQuery =
      ''' SELECT * FROM "AppCategories" WHERE products != NULL''';
  static const getProductsQuery =
      ''' SELECT productid, title, price, description, images, cid, size FROM public."AppProducts"; ''';
  static const createProductsQuery =
      ''' INSERT INTO "AppProducts"(productid, title, price, description, images, size) VALUES (@productid, @title, @price, @description, @images, @size) RETURNING productid, title, price, description, images, size; ''';
  static const createCategoryQuery =
      ''' INSERT INTO "AppCategories" (categoryid, title, iconimage, products)
          VALUES(@categoryid, @title, @iconimage, @products)
          RETURNING categoryid, title, iconimage, products;
        ''';
  static const addProductQuery = '''
          UPDATE "AppCategories" 
          SET products = ARRAY[@products]
          WHERE categoryid = @categoryid;
        ''';
 
}




/* {"{\"productid\":null,
\"cid\":\"\",
\"title\":\"Calças Femininas\",
\"description\":\"Jeans atraente e de cores vívidas\",
\"price\":245,
\"size\":[\"34\",\"36\",\"38\",\"40\",\"42\",\"44\"],
\"images\":[\"https: //images.pexels.com/photos/2294342/pexels-photo-2294342.jpeg?auto=compress&cs=tinysrgb&w=600\",
\"https://images.pexels.com/photos/1656684/pexels-photo-1656684.jpeg?auto=compress&cs=tinysrgb&w=600\",
\"https://images.pexels.com/photos/991509/pexels-photo-991509.jpeg?auto=compress&cs=tinysrgb&w=600\"]}"} */