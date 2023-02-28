using System.Data.SqlClient;
using HowgartsAPI.Conexion;
using HowgartsAPI.Models;
using Microsoft.Data.SqlClient;

namespace HowgartsAPI.Datos
{
    public class DEstudiantes
    {
        ConexionDB cn = new ConexionDB();

        public async Task<List<MEstudiante>> MostrarEstudiantes()
        {
            var lista = new List<MEstudiante>();
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("mostrar", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            var mestudiante = new MEstudiante();
                            mestudiante.ID = (int)item["ID"];
                            mestudiante.Nombre = (string)item["Nombre"];
                            mestudiante.Apellido = (string)item["Apellido"];
                            mestudiante.Cedula = (int)item["Cedula"];
                            mestudiante.Escuela = (string)item["Escuela"];
                            lista.Add(mestudiante);
                        }
                    }
                }
            }
            return lista;
        }

        public async Task InsertarEstudiante(MEstudiante parametros)
        {
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using(var cmd = new SqlCommand("insertar", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Nombre", parametros.Nombre);
                    cmd.Parameters.AddWithValue("@Apellido", parametros.Apellido);
                    cmd.Parameters.AddWithValue("@Cedula", parametros.Cedula);
                    cmd.Parameters.AddWithValue("@Escuela", parametros.Escuela);
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }
            }
        }
        public async Task EditarEstudiante(MEstudiante parametros)
        {
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("actualizar", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ID", parametros.ID);
                    cmd.Parameters.AddWithValue("@Nombre", parametros.Nombre);
                    cmd.Parameters.AddWithValue("@Apellido", parametros.Apellido);
                    cmd.Parameters.AddWithValue("@Cedula", parametros.Cedula);
                    cmd.Parameters.AddWithValue("@Escuela", parametros.Escuela);
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }
            }
        }
        public async Task EliminarEstudiante(MEstudiante parametros)
        {
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("borrar", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ID", parametros.ID);
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }
            }
        }
    }
}
