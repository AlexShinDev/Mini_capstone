User.create!([
  {name: "Joe Smoe", email: "Joe@gmail.com", password: "password", password_confirmation: "password", admin: false},
  {name: "Alex Shin", email: "alex@gmail.com", password: "password", password_confirmation: "password", admin: true}
])
Category.create!([
  {name: "Top"},
  {name: "Bottom"},
  {name: "Cold Weather"},
  {name: "Warm Weather"}
])
Supplier.create!([
  {name: "Bobby Rays", email: "B_rays@hotmail.com", phone: "894-123-2353"},
  {name: "Jordan Monkey", email: "J_monkey@gmail.com", phone: "939-847-0284"},
  {name: "Michael Gordon", email: "M_gordon@aol.com", phone: "940-579-1928"}
])
Product.create!([
  {product_type: "Shirt", description: "White shirt with gray checkered design", price: "15.0", in_stock: nil, supplier_id: 1},
  {product_type: "T-shirt", description: "Blue t-shirt with a lightbulb design", price: "5.0", in_stock: nil, supplier_id: 3},
  {product_type: "Chino Shorts", description: "Light brown shorts", price: "10.0", in_stock: nil, supplier_id: 1},
  {product_type: "Two-piece Suit", description: "Good for any formal occasion", price: "150.0", in_stock: nil, supplier_id: 3},
  {product_type: "Jacket", description: "Red jacket for winter", price: "70.0", in_stock: nil, supplier_id: 2}
])
CategoryProduct.create!([
  {product_id: 2, category_id: 1},
  {product_id: 2, category_id: 3},
  {product_id: 2, category_id: 4},
  {product_id: 3, category_id: 1},
  {product_id: 3, category_id: 3},
  {product_id: 3, category_id: 4},
  {product_id: 4, category_id: 1},
  {product_id: 4, category_id: 3},
  {product_id: 5, category_id: 2},
  {product_id: 5, category_id: 4},
  {product_id: 6, category_id: 1},
  {product_id: 6, category_id: 2},
  {product_id: 6, category_id: 3},
  {product_id: 6, category_id: 4}
])
Image.create!([
  {product_id: 2, url: "http://www.patagonia.com/dis/dw/image/v2/ABBM_PRD/on/demandware.static/-/Sites-patagonia-master/default/dwf146646c/images/hi-res/45651_TRUT.jpg?sw=750&sh=750&sm=fit&sfrm=png"},
  {product_id: 2, url: "http://assets.academy.com/mgen/50/10740350.jpg"},
  {product_id: 2, url: "http://www.patagonia.com/dis/dw/image/v2/ABBM_PRD/on/demandware.static/-/Sites-patagonia-master/default/dwc89f3efd/images/hi-res/52921_CTYB.jpg?sw=750&sh=750&sm=fit&sfrm=png"},
  {product_id: 3, url: "http://www.sunspel.com/media/catalog/product/cache/3/image/9df78eab33525d08d6e5fb8d27136e95/4/0/4001_102_5_3.jpg"},
  {product_id: 4, url: "http://www.patagonia.com/dis/dw/image/v2/ABBM_PRD/on/demandware.static/-/Sites-patagonia-master/default/dwe18bb533/images/hi-res/83685_BLK.jpg?sw=750&sh=750&sm=fit&sfrm=png"},
  {product_id: 5, url: "http://sc02.alicdn.com/kf/UT88vkbXYBXXXagOFbXu/Cotton-Jeans-Chino-Short-high-quality-chino.jpg"},
  {product_id: 6, url: "https://www.indochino.com/images/productimages/1438027301.334230623.primary.original.jpg"}
])
