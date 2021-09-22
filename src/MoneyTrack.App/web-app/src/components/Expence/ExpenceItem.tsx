import { Button, ListGroup } from 'react-bootstrap';
import { ExpenceResponse } from "../../clients/src/clients";

const ExpenceItem = ({ expence, onRemovePressed }:{ expence: ExpenceResponse, onRemovePressed: any }) => {
    return (
        <ListGroup.Item as="li">
            {JSON.stringify(expence)}
            &nbsp;<Button variant="outline-danger" size="sm" onClick={() => onRemovePressed(expence.id)} className="remove-button">Remove</Button>
        </ListGroup.Item>
    );
}

export default ExpenceItem;