import React, { useState, useEffect} from "react";
import ReactDOM from "react-dom";
import axios from 'axios';
import { Row, Col } from "react-bootstrap";

import ItemList from "./ItemList";
import Cart from "./Cart";
import {env} from "../env";
import "bootstrap/dist/css/bootstrap.min.css";

function Shop() {
  const [cart, setCart] = useState([]);

  useEffect(() => {

    axios.get(env.APP_CART_URL)
      .then(response => {
          setCart(response.data);
      })
      .catch(error => {
      });
  }, []); // The empty array ensures this effect runs only once after the initial render

  const  addItemToCart = async (product_id) =>{
    axios.get(env.APP_ADD_CART_URL, {params: {product_id: product_id}})
    .then(response => { 
        setCart(response.data);
    })
    .catch(error => {
    });
  }
  const  emptyCart = async () =>{
    axios.get(env.APP_EMPTY_CART_URL)
    .then(response => {
        setCart(response.data);
    })
    .catch(error => {
    });
  }

  return (
    <>
    <h1 className="text-center"> Welcome to Crazy Amenitiz Shop</h1>
    <br />
      <Row>
        <Col sm={8}>
          <ItemList addItemToCart={addItemToCart} />
        </Col>
        <Col sm={4}>
          <Cart cart={cart} emptyCart={emptyCart}/>
        </Col>
      </Row>
    </>

  );
}
export default Shop;