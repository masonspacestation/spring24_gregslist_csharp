namespace csharp_gregslist_api.Models;

public class Car
{
  public int Id { get; set; }
  public DateTime CreatedAt { get; set; }
  public DateTime UpdatedAt { get; set; }
  public string Make { get; set; }
  public string Model { get; set; }
  public int Year { get; set; }
  public int Price { get; set; }
  public string ImgUrl { get; set; }
  public string Description { get; set; }
  public string EngineType { get; set; }
  public string Color { get; set; }
  public int Mileage { get; set; }
  public bool HasCleanTitle { get; set; }
  public string CreatorId { get; set; }

  public Account Creator { get; set; }
}