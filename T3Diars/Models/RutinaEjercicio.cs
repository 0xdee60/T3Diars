using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace T3Diars.Models
{
    public class RutinaEjercicio
    {
        public int idRutinaEjercicio { get; set; }
        public int idEjercicio { get; set; }
        public int idRutina { get; set; }
        public int tiempo { get; set; }

        public Ejercicio ejercicio { get; set; }
        public Rutina rutina { get; set; }
    }
}
