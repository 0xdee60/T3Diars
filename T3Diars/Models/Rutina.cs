using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace T3Diars.Models
{
    public class Rutina
    {
        public int idRutina { get; set; }
        public string nombre { get; set; }
        public string tipo { get; set; }
        public int idCreador { get; set; }

        public Usuario creador { get; set; }
    }
}
