using System.Data.SqlClient;
using HowgartsAPI.Conexion;
using HowgartsAPI.Models;
using Microsoft.Data.SqlClient;

namespace HowgartsAPI.Datos
{
    public class DEscuela
    {
        ConexionDB cn = new ConexionDB();

        public async Task<List<MEscuela>> MostrarEstudiantes()
        {
            var listaE = new List<MEscuela>();
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("mostrarE", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            var mescuela = new MEscuela();
                            mescuela.IDEscuela = (int)item["IDEscuela"];
                            mescuela.Escuela = (string)item["Escuela"];
                            listaE.Add(mescuela);
                        }
                    }
                }
            }
            return listaE;
        }
    }
}
