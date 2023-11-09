import React, {useState, useEffect} from 'react'


import { Card, Button } from 'react-bootstrap'
import CartItem from './CartItem';
import CartHeader from './CartHeader';


function Cart(props) {
    const [cart, setCart] = useState([]);

     const emptyCart = () =>{
        props.emptyCart();
     } 
  return (
    <>
     <Card >
            <Card.Body>
              <Card.Title>Cart</Card.Title>
              
              <Card.Text>
              <CartHeader />  
              {props.cart && props.cart.items && props.cart.items.map((cartItem) => (
                <CartItem cartItem={cartItem} key={cartItem.product.id}/>
              ))}
              <hr />
              <b>Cart Total:</b> {props.cart.total} €
              <Button variant="info float-end" onClick={emptyCart}>Empty Cart</Button>
              </Card.Text>
              
            </Card.Body>
          </Card>
    
   </>
  )
}

export default Cart
