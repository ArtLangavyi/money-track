import { Button, ListGroup } from 'react-bootstrap';
import { ProductResponse } from "../../clients/src/clients";

const ProductTypeItem = ({ product, onRemovePressed }:{ product: ProductResponse, onRemovePressed: any }) => {
    return (
        <ListGroup.Item as="li">
            {product.name}
            &nbsp;<Button variant="outline-danger" size="sm" onClick={() => onRemovePressed(product.id)} className="remove-button">Remove</Button>
        </ListGroup.Item>
    );
}

export default ProductTypeItem;