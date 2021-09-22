import { Button, ListGroup } from 'react-bootstrap';
import { UserResponse } from "../../clients/src/clients";

const UserItem = ({ user, onRemovePressed }:{ user: UserResponse, onRemovePressed: any }) => {
    return (
        <ListGroup.Item as="li">
            {user.firstName} &nbsp;{user.middleName} &nbsp;{user.lastName} &nbsp;
            &nbsp;<Button variant="outline-danger" size="sm" onClick={() => onRemovePressed(user.id)} className="remove-button">Remove</Button>
        </ListGroup.Item>
    );
}

export default UserItem;