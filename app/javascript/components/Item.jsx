import React, { useEffect, useState } from 'react';
import { Card, Button } from 'react-bootstrap';

function Item(props) {
    
    const addItemToCart= () => {
        props.addItemToCart(props.product.id)
    }
    let element =<></>
    if(props.product){
        element = (<Card.Body>
        <Card.Title>{props.product.name}</Card.Title>
        <Card.Text style={{height: "75%"}}>
            <b> Code: </b> {props.product.product_code}<br />
            <b> Price: </b> {props.product.price} €<br />
            <b> Offer: </b> {props.product.offer.name} <br /> <br />
            <b>Why We Wanted to Give You this offer? </b> {props.product.offer.description}
        </Card.Text>
        <Button variant="primary" onClick={addItemToCart}>Add To Cart</Button>
      </Card.Body>)
    }
  return (
    <>
        {element}
    </>
  
  )
}

export default Item
