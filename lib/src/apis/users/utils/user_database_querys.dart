abstract class UserDatabaseQuerys {
  static const getAllUsers =
      ''' SELECT user_id, name, email, city FROM "AppUser" ''';
  static const getUserById = ''' SELECT user_id, name, email, city
                                 FROM "AppUser" 
                                 WHERE user_id = @user_id; ''';
  static const createUser = ''' INSERT INTO "AppUser"(
	user_id, email, password, city, name)
	VALUES (@user_id, @email, @password, @city, @name) RETURNING user_id, email, password, city, name; ''';
  static const deleteUser = ''' DELETE FROM "AppUser" WHERE user_id = @user_id; ''';
}
