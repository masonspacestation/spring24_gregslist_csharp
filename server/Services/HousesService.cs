


namespace csharp_gregslist_api.Services;

public class HousesService
{
  private readonly HousesRepository _repository;

  public HousesService(HousesRepository repository)
  {
    _repository = repository;
  }

  internal House CreateHouse(House houseData)
  {
    House house = _repository.CreateHouse(houseData);
    return house;
  }

  internal string DestroyHouse(int houseId, string userId)
  {
    House houseToDestroy = GetHouseById(houseId);
    if (houseToDestroy.CreatorId != userId)
    {
      throw new Exception("You are not authorized to delete this house.");
    }
    _repository.DestroyHouse(houseId);
    return $"{houseToDestroy.Bedrooms} bedroom {houseToDestroy.Bathrooms} bathroom house has been deleted.";
  }

  internal List<House> GetAllHouses()
  {
    List<House> houses = _repository.GetAllHouses();
    return houses;
  }

  internal House GetHouseById(int houseId)
  {
    House house = _repository.GetHouseById(houseId);

    if (house == null)
    {
      throw new Exception($"Invalid ID: {houseId}");
    }
    return house;
  }
}