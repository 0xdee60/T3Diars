using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using T3Diars.Models;
using T3Diars.Models.Estrategia;

namespace T3Diars.Controllers
{
    public class UsuarioController : Controller
    {
        public T3Context cnx;
        public IConfiguration configuration;
        public UsuarioController(T3Context cnx, IConfiguration configuration)
        {
            this.cnx = cnx;
            this.configuration = configuration;
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(string nombreCompleto, string usuario, string passwd)
        {
            var user = new Usuario();


            user.nombreCompleto = nombreCompleto;

            user.usuario = usuario;

            user.passwd = CreateHash(passwd);

            cnx.Usuarios.Add(user);

            cnx.SaveChanges();


            return RedirectToAction("Login","Usuario");
        }



        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string username, string passwd)
        {
            var usuario = cnx.Usuarios.Where(o => o.usuario == username && CreateHash(passwd) == o.passwd).FirstOrDefault();
            if (usuario != null)
            {
                // Autenticaremos
                var claims = new List<Claim> {
                    new Claim(ClaimTypes.Name, username)
                };

                var claimsIdentity = new ClaimsIdentity(claims, "Login");
                var claimsPrincipal = new ClaimsPrincipal(claimsIdentity);


                HttpContext.SignInAsync(claimsPrincipal);

                return RedirectToAction("Index", "Usuario");
            }

            return View();
        }

        private string CreateHash(string input)
        {
            var sha = SHA256.Create();
            input += configuration.GetValue<string>("Token");
            var hash = sha.ComputeHash(Encoding.Default.GetBytes(input));

            return Convert.ToBase64String(hash);
        }

        [HttpGet]
        public ActionResult CrearRutina()
        {


            return View();
        }
        [HttpPost]
        public ActionResult CrearRutina(string nombre, string tipo)
        {
            var rutina = new Rutina();
            var claim = HttpContext.User.Claims.FirstOrDefault();

            int idLogeado = cnx.Usuarios.Where(o => o.usuario == claim.Value).FirstOrDefault().idUsuario;
            rutina.nombre = nombre;
            rutina.tipo = tipo;
            rutina.idCreador = idLogeado;
            cnx.Rutinas.Add(rutina);
            cnx.SaveChanges();
            int idRutina = rutina.idRutina;
            switch (tipo)
            {
                case "Principiante":
                    var principiante = new Principiante(cnx);
                    
                    
                    principiante.generarEjercicios(idRutina);
                   
                    break;
                case "Intermedio":
                    var intermedio = new Intermedio(cnx);
                   

                    intermedio.generarEjercicios(idRutina);
                    break;
                case "Avanzado":
                    var avanzado = new Avanzado(cnx);
                    

                    avanzado.generarEjercicios(idRutina);
                    break;
            }

            cnx.SaveChanges();


            return RedirectToAction("Index","Usuario") ;
        }

        public ActionResult Index()
        {
            var claim = HttpContext.User.Claims.FirstOrDefault();

            int idLogeado = cnx.Usuarios.Where(o => o.usuario == claim.Value).FirstOrDefault().idUsuario;
            ViewBag.Rutinas = cnx.Rutinas.Where(o => o.idCreador == idLogeado).ToList();
            return View();
        }

        public ActionResult DetalleRutina(int idRutina)
        {
            var ejercicios = cnx.RutinaEjercicios.Include(o=>o.ejercicio).Where(o => o.idRutina == idRutina).ToList();
            ViewBag.Ejercicios = ejercicios;
            return View();
        }

    }
}
