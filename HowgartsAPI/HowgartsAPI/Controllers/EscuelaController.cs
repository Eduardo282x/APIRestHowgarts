using HowgartsAPI.Datos;
using HowgartsAPI.Models;
using Microsoft.AspNetCore.Mvc;

namespace HowgartsAPI.Controllers
{
    public class EscuelaController
    {
        [ApiController]
        [Route("api")]
        public class EstudianteController
        {
            [HttpGet]
            [Route("showE")]
            public async Task<ActionResult<List<MEstudiante>>> Get()
            {
                var funcion = new DEstudiantes();
                var listaE = await funcion.MostrarEstudiantes();
                return listaE;
            }
        }
    }
}
