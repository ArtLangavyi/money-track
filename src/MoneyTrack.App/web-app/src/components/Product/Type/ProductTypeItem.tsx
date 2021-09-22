import { Button, ListGroup } from 'react-bootstrap';
import { ProductTypeResponse } from "../../../clients/src/clients";

const ProductTypeItem = ({ productType, onRemovePressed }:{ productType: ProductTypeResponse, onRemovePressed: any }) => {
    return (
        <ListGroup.Item as="li">
            {productType.name}
            &nbsp;<Button variant="outline-danger" size="sm" onClick={() => onRemovePressed(productType.id)} className="remove-button">Remove</Button>
        </ListGroup.Item>
    );
}

export default ProductTypeItem;