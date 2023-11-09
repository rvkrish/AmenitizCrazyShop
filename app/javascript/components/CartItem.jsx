import React from 'react'
import { Row, Col } from 'react-bootstrap'
function CartItem(props) {
    
    return (
      
            <Row>
                <Col sm={3}>
                    {props.cartItem.product.product_code}
                </Col>
                <Col sm={3}>
                    {props.cartItem.quantity}
                </Col>
                <Col sm={3}>
                    {props.cartItem.product.price} €
                </Col>
                <Col sm={3}>
                    {props.cartItem.price} €
                </Col>
            </Row>
  
    )
}

export default CartItem
