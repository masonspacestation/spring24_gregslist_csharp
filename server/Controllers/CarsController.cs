namespace csharp_gregslist_api.Controllers;

[ApiController]
[Route("api/[controller]")]
// [Route("api/cars")]
public class CarsController : ControllerBase
{
  private readonly CarsService _carsService;
  private readonly Auth0Provider _auth0Provider;

  public CarsController(CarsService carsService, Auth0Provider auth0Provider)
  {
    _carsService = carsService;
    _auth0Provider = auth0Provider;
  }

  [Authorize]
  [HttpPost]
  public async Task<ActionResult<Car>> CreateCar([FromBody] Car carData)
  {
    try
    {

      // node equivalent: const userInfo = request.userInfo
      // HttpContext request and response wrapped into one object
      Account userInfo = await _auth0Provider.GetUserInfoAsync<Account>(HttpContext);

      carData.CreatorId = userInfo.Id;

      Car car = _carsService.CreateCar(carData);
      return Ok(car);
    }
    catch (Exception exception)
    {
      return BadRequest(exception.Message);
    }
  }
}