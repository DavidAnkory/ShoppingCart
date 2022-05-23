using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using Newtonsoft.Json;

namespace ShoppingCart.Models
{
    public class ProductDatabaseInitializer : DropCreateDatabaseIfModelChanges<ProductContext>
    {


        public static  void Seed(ProductContext context)
        {
           
            context.Products.AddRange(GetProducts());
            context.SaveChanges();

        }

        private static string GetJson()
        {
            var json = String.Empty;
            using (WebClient wc = new WebClient())
            {
                json = wc.DownloadString("https://fakestoreapi.com/products");
            }

            return json;
        }


        public static List<Product> GetProducts()
        {
            List<Product> products = JsonConvert.DeserializeObject<List<Product>>(GetJson());
            return products;
        }
    }
}