import { Button, Accordion, Card } from 'react-bootstrap';
import { OrderResponse } from "../../clients/src/clients";
import ExpenceList from '../Expence/ExpenceList';
import ExpenceForm from '../Expence/ExpenceForm';

const OrderItem = ({ order, eventKey, onRemovePressed }:{ order: OrderResponse, eventKey:string, onRemovePressed: any }) => {

    
    return (   
        <Card>
            <Accordion.Toggle as={Card.Header} eventKey={eventKey}>
            <Card.Title>{order.id}</Card.Title>
            <Card.Subtitle >{JSON.stringify(order)}</Card.Subtitle>
                &nbsp;<Button variant="outline-danger" size="sm" onClick={() => onRemovePressed(order.id)} className="remove-button">Remove</Button>
            </Accordion.Toggle>

            <Accordion.Collapse eventKey={eventKey}>
                <Card.Body>
                    <ExpenceForm orderId={order.id as number} />
                    <ExpenceList orderId={order.id as number} />
                </Card.Body>
            </Accordion.Collapse>
        </Card>            
    );
}

export default OrderItem;