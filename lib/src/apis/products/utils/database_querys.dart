abstract class DatabaseQuerys {
  static const getProductById =
      ''' SELECT productid, title, price, description, images, "size"
          FROM "AppProducts" 
          WHERE productid = @productid; ''';
  static const getCategoryById = ''' SELECT *
          FROM "AppCategories" 
          WHERE categoryid = @categoryid ''';
  static const getCategoriesQuery = ''' SELECT * FROM "AppCategories" ''';
  static const getProductsQuery =
      ''' SELECT productid, title, price, description, images, size FROM public."AppProducts"; ''';
  static const createProductsQuery =
      ''' INSERT INTO "AppProducts"(productid, title, price, description, images, size) VALUES (@productid, @title, @price, @description, @images, @size) RETURNING productid, title, price, description, images, size; ''';
  static const createCategoryQuery =
      ''' INSERT INTO "AppCategories"(categoryid, title, iconimage)
          VALUES(@categoryid, @title, @iconimage)
          RETURNING categoryid, title, iconimage;
        ''';
  static const associationQuery = '''
          INSERT INTO "CatAndProd" (cp_id, cat_id, prod_id) VALUES(@cp_id, @cat_id, @prod_id ) RETURNING cp_id, cat_id, prod_id;
        ''';
}
