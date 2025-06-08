using Microsoft.AspNetCore.Mvc;

namespace GithubCopilotDemoWebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {

        private static List<WeatherForecast> _weatherForecastDatas = new()
        {
            new WeatherForecast {id = 1, Date = DateOnly.FromDateTime(DateTime.Now.AddDays(1)), TemperatureC = 10, Summary = "Cool" },
            new WeatherForecast {id = 2, Date = DateOnly.FromDateTime(DateTime.Now.AddDays(2)), TemperatureC = 15, Summary = "Mild" },
            new WeatherForecast {id = 3, Date = DateOnly.FromDateTime(DateTime.Now.AddDays(3)), TemperatureC = 20, Summary = "Warm" },
            new WeatherForecast {id = 4,  Date = DateOnly.FromDateTime(DateTime.Now.AddDays(4)), TemperatureC = 25, Summary = "Balmy" },
            new WeatherForecast {id = 5, Date = DateOnly.FromDateTime(DateTime.Now.AddDays(5)), TemperatureC = 30, Summary = "Hot" }
        };

        private readonly ILogger<WeatherForecastController> _logger;

        public WeatherForecastController(ILogger<WeatherForecastController> logger)
        {
            _logger = logger;
        }

        [HttpGet(Name = "GetWeatherForecast")]
        public IEnumerable<WeatherForecast> Get()
        {
            return _weatherForecastDatas;
        }

        /// <summary>
        /// 取得單筆
        /// Get: api/WeatherForecast/{id}
        /// </summary>
        [HttpGet("{id}")]
        public WeatherForecast Get(long? id)
        {
            WeatherForecast? weatherForecast = _weatherForecastDatas.Where(m => m.id == id).FirstOrDefault();

            return (weatherForecast is null) ? new WeatherForecast() : weatherForecast;
        }

        /// <summary>
        /// 新增
        /// Post: api/WeatherForecast
        /// </summary>
        [HttpPost]
        public IActionResult Post([FromBody] WeatherForecast weatherForecast)
        {
            if (weatherForecast == null)
                return BadRequest("資料不得為空");

            // 產生新的 id（取目前最大 id + 1，若無資料則為 1）
            long newId = (_weatherForecastDatas.Count == 0) ? 1 : _weatherForecastDatas.Max(x => x.id) + 1;
            weatherForecast.id = newId;

            _weatherForecastDatas.Add(weatherForecast);


            return CreatedAtAction(nameof(Get), new { id = weatherForecast.id }, weatherForecast);
        }



        /// <summary>
        /// 移除
        /// Delete: api/WeatherForecast/Removed
        /// </summary>
        [HttpDelete, Route("[action]")]
        public IActionResult Removed([FromBody] List<long>? ids)
        {
            if (ids == null || !ids.Any())
                return BadRequest("請提供要移除的 id 清單");

            // 找出要移除的資料
            var toRemove = _weatherForecastDatas.Where(w => ids.Contains(w.id)).ToList();

            foreach (var item in toRemove)
            {
                _weatherForecastDatas.Remove(item);
            }
            return Ok(new { removedCount = toRemove.Count });
        }
    }
}
