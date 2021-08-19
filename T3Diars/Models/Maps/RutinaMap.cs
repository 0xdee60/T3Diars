using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace T3Diars.Models.Maps
{
    public class RutinaMap : IEntityTypeConfiguration<Rutina>
    {
        public void Configure(EntityTypeBuilder<Rutina> builder)
        {
            builder.ToTable("Rutina");

            builder.HasKey(o=>o.idRutina);

            builder.HasOne(o => o.creador).WithMany().HasForeignKey(o => o.idCreador);
        }
    }
}
