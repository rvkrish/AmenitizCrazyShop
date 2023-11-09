<h1> Welcome to Amenitiz Crazy Shop</h1>
<h2> Basic Requrement </h2>
<pre>
It has a UI where the user can add products to a cart and compute the total price (it can be a simple CLI)
It is usable while remaining as simple as possible
It is readable
It is maintainable
It is easily extendable
</pre>
<h2>This is how the application looks</h2> <br/>
  
<img src='https://github.com/rvkrish/AmenitizCrazyShop/blob/7d3fdb3e621d11139101fa5cf99a50af2a8da745/public/Screenshot%202023-11-09%20at%205.56.11%20PM.png' width='900'>

<h3> Known Assumptions Made </h3>
<pre>
  1. No Checkout Functionality.
  2. It's just a basic UI without much design.
  3. Each product can avail of one offer at a time(to simplify the implementation)
  4. Only one quantity will be incremented at a time (The model level provided the ability to add multiple quantities, 
      but from UI, it assumed that we could add only one quantity)
</pre>


<h3> Installation and starting the server: </h3>

- Download the source code.
- Run the **bundle install** command.
- Run **yarn build**
- Install Redis Serve.
- Start **redis server**
- Start the server using **bin/div**.
- Running Rspec **rspec**

<h3>Tools Used: </h3>
<pre>
    1. Ruby & Ruby On Rails.
    2. Redis Sever for caching the cart.
    3. React Using esbuild and bootstrap for creating simple UI.
    4. SQLite db (default).
</pre>
<h3> What has been implemented</h3>
<pre>
  Approach to implementing the code: TDD.
  1. Addressed all requirements mentioned.
  2. Simple scaffold to feed product and offer information.
  3. Simple UI to display the functionality using react.
</pre>
  What Application can do:


## Overview of each model created

The `CartItem` model has several key functionalities this is a non active record model:

- Initializing new cart items.
- Adding products to the cart.
- Incrementing the quantity of existing products in the cart.
- Updating the price and quantity of cart items.

The `Cart` model has several key functionalities this is a non active record model:

- Adding Products to the Cart
- Emptying the Cart.
- Calculating the Total Price of the cart
  
The `Product` and `Offer` model  helps to store respective product and Offers related information below is the respective ERD. 
<img src='https://github.com/rvkrish/AmenitizCrazyShop/blob/83c3369cd437e47df3a774285847e2edf2bf58b9/public/Screenshot%202023-11-09%20at%206.35.12%20PM.png' width='600'>


**Some known improvements that can be made:**

- We can add a coverage report.
- flash messages and notices.
- We can include integration test cases.
- Can add some more edge cases for controllers.
- Can include specs for UI.
- Ability to reduce the quntity.
  
