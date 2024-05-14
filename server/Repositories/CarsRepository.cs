
namespace csharp_gregslist_api.Repositories;

public class CarsRepository
{
  private readonly IDbConnection _db;

  public CarsRepository(IDbConnection db)
  {
    _db = db;
  }

  internal Car CreateCar(Car carData)
  {
    string sql = @"
    INSERT INTO
    cars(
      make,
      model,
      year,
      price,
      imgUrl,
      description,
      engineType,
      color,
      mileage,
      hasCleanTitle,
      creatorId
    )
    VALUES(
      @Make,
      @Model,
      @Year,
      @Price,
      @ImgUrl,
      @Description,
      @EngineType,
      @Color,
      @Mileage,
      @HasCleanTitle,
      @CreatorId
    );
    
    SELECT * FROM cars WHERE id = LAST_INSERT_ID();";

    Car car = _db.Query<Car>(sql, carData).FirstOrDefault();

    return car;
  }
}