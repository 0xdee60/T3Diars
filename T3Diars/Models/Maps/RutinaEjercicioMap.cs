using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace T3Diars.Models.Maps
{
    public class RutinaEjercicioMap : IEntityTypeConfiguration<RutinaEjercicio>
    {
        public void Configure(EntityTypeBuilder<RutinaEjercicio> builder)
        {
            builder.ToTable("RutinaEjercicio");
            builder.HasKey(o=>o.idRutinaEjercicio);

            builder.HasOne(o => o.rutina).WithMany().HasForeignKey(o=>o.idRutina);
            builder.HasOne(o => o.ejercicio).WithMany().HasForeignKey(o=>o.idEjercicio);
        }
    }
}
