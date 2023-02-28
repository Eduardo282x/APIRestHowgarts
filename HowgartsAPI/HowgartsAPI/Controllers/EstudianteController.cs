using HowgartsAPI.Datos;
using HowgartsAPI.Models;
using Microsoft.AspNetCore.Mvc;


namespace HowgartsAPI.Controllers
{
    [ApiController]
    [Route("api")]
    public class EstudianteController : ControllerBase
    {
        [HttpGet]
        [Route("show")]
        public async Task<ActionResult<List<MEstudiante>>> Get()
        {
            var funcion = new DEstudiantes();
            var lista = await funcion.MostrarEstudiantes();
            return lista;
        }


        [HttpPost]
        [Route("insert")]
        public async Task Post([FromBody] MEstudiante parametros)
        {
            var funcion = new DEstudiantes();
            await funcion.InsertarEstudiante(parametros);
        }

        [HttpPut("ID")]
        [Route("update")]
        public async Task<ActionResult> Put(int ID,[FromBody] MEstudiante parametros)
        {
            var funcion = new DEstudiantes();
            parametros.ID = ID;
            await funcion.EditarEstudiante(parametros);
            return NoContent();
        }

        [HttpDelete("ID")]
        [Route("delete")]
        public async Task<ActionResult> Delete(int ID)
        {
            var funcion = new DEstudiantes();
            var parametros = new MEstudiante();
            parametros.ID = ID;
            await funcion.EliminarEstudiante(parametros);
            return NoContent();
        }
    }
}
