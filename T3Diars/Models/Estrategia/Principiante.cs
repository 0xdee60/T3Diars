using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace T3Diars.Models.Estrategia
{
    public class Principiante : IEstrategia
    {
        public T3Context cnx;
     
        public Principiante(T3Context cnx)
        {
            this.cnx = cnx;
      
        }
        public void generarEjercicios(int idRutina)
        {
            var random = new Random(System.DateTime.Now.Millisecond);
            for (int i = 1; i<=5; i++)
            {
                var ejercicioRutina = new RutinaEjercicio();
                ejercicioRutina.idEjercicio = random.Next(1,21);
                ejercicioRutina.idRutina = idRutina;
                ejercicioRutina.tiempo = random.Next(60, 121);

                cnx.RutinaEjercicios.Add(ejercicioRutina);
                cnx.SaveChanges();
            }
        }
    }
}
