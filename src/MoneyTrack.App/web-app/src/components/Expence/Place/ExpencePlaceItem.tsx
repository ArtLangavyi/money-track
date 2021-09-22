import { Button, ListGroup } from 'react-bootstrap';
import { ExpencePlaceResponse } from "../../../clients/src/clients";

const ExpencePlaceItem = ({ expencePlace, onRemovePressed }:{ expencePlace:ExpencePlaceResponse, onRemovePressed: any }) => {
    return (
        <ListGroup.Item as="li">
            {expencePlace.name}
            &nbsp;<Button variant="outline-danger" size="sm" onClick={() => onRemovePressed(expencePlace.id)} className="remove-button">Remove</Button>
        </ListGroup.Item>
    );
}

export default ExpencePlaceItem;