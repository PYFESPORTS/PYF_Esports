﻿using Microsoft.AspNetCore.Mvc;

namespace PYF_Esports_MVC.Areas.Users.Controllers
{
    [Area("Users")]
    public class UsersController : Controller
    {
        public IActionResult Schedule()
        {
            return View();
        }

        public IActionResult Teams()
        {
            return View();
        }
    }
}