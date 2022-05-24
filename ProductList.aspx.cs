using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoppingCart.Logic;
using ShoppingCart.Models;

namespace ShoppingCart
{
    public partial class ProductList : System.Web.UI.Page
    {
      
        public IQueryable<Product> GetProducts([QueryString("id")] int?
            categoryId)
        {
            var _db = new ProductContext();
            IQueryable<Product> query = _db.Products;
            if (categoryId.HasValue && categoryId > 0)
            {
                query = query.Where(p => p.id == categoryId);
            }
            return query;
        }

    }

}
