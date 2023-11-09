import React from 'react'
import { Col, Row } from 'react-bootstrap'

function CartHeader() {
  return (
    <Row>
    <Col sm={3}>
        <b> Name </b>
    </Col>
    <Col sm={3}>
        <b> Quantity </b>
    </Col>
    <Col sm={3}>
        <b> Price/Unit </b>
    </Col>
    <Col sm={3}>
        <b> Price </b>
    </Col>
</Row>
  )
}

export default CartHeader
