import React, {useState, useEffect} from 'react'
import axios from 'axios';
import { Card } from 'react-bootstrap'
import {env} from '../env'
import Item from './Item';
function ItemList(props) {
    const [products, setProducts] = useState([]);

    useEffect(() => {
      axios.get(env.PRODUCT_URL)
        .then(response => {
          setProducts(response.data);
        })
        .catch(error => {
        });
    }, []); // The empty array ensures this effect runs only once after the initial render
  
  return (
    <>
     {products.map(product => (
         <Card style={{ width: '18rem', float:'left', margin:'1px', height:"100%" }} key={product.id} ><Item product={product} addItemToCart={props.addItemToCart}/></Card> 
        ))}
    </>
  )
}

export default ItemList
