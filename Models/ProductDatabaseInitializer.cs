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


        protected override void Seed(ProductContext context)
        {
            GetProducts().ForEach(p => context.Products.Add(p));
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


        private static List<Product> GetProducts()
        {
            List<Product> products = JsonConvert.DeserializeObject<List<Product>>(GetJson());
            return products;
        }
    }
}