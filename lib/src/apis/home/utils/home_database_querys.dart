abstract class HomeDatabaseQuerys {
  static const getImagesQuery =
                        ''' SELECT id, url, "position", "xAxis", "yAxis" 
                            FROM "HomeImages"; ''';

  static const uploadImageQuery = ''' 
                            INSERT INTO "HomeImages"(url, position, "xAxis", "yAxis") 
                            VALUES (@url, @position, @xAxis, @yAxis) 
                            RETURNING id, url, position,"xAxis", "yAxis";
                            ''';
}
