import React, { useState, useEffect } from 'react';
import { connect, useDispatch } from 'react-redux';
import { Button, InputGroup, Form, Spinner, Dropdown } from 'react-bootstrap';
import { ExpencePlaceResponse, UserResponse} from "../../clients/src/clients";
import { addOrder } from './thunks';
import { getExpencePlaceList, getExpencePlaceListLoading } from '../Expence/Place/selectors';
import { loadExpencePlaceList } from '../Expence/Place/thunks';
import { getUserListLoading, getUserList } from '../Users/selectors';
import { loadUserList } from '../Users/thunks';

const OrderForm = ({ expencePlaceList, userList, onCreatePressed, isLoadingExpencePlaces, isLoadingUsers}
    : { expencePlaceList:ExpencePlaceResponse[], userList: UserResponse[], onCreatePressed:any, isLoadingExpencePlaces:any, isLoadingUsers:any}) => {
    const [formData, setFormData] = useState({
        total: 0.0,
        totalDiscount: 0.0,
        userId: 0,
        paymentDate: null,
        isAutomatedPayment: false,
        expencePlaceId: 0
      });

    const [selectedExpencePlace, setSelectedExpencePlace] = useState({
        id: 0,
        name: 'Place'
      });

    const [selectedUser, setSelectedUser] = useState({
        id: 0,
        name: 'User'
      });

    const dispatch = useDispatch();
    useEffect(() => {
        dispatch(loadExpencePlaceList() as any);
        dispatch(loadUserList() as any);
    }, [dispatch]);
    

    return (
        <div>
            <InputGroup className="mb-3">
                <Form.Control
                name="name" 
                type="text"
                value={formData.total}
                placeholder="Total"
                aria-label="Total"
                aria-describedby="basic-addon2"
                onChange={e => setFormData({...formData, total: Number(e.target.value)})}
                required
                />
                <InputGroup className="mb-3">
                    <Form.Control
                        name="name" 
                        type="text"
                        value={formData.totalDiscount}
                        placeholder="Total"
                        aria-label="Total"
                        aria-describedby="basic-addon2"
                        onChange={e => setFormData({...formData, totalDiscount: Number(e.target.value)})}
                        required
                        />
                </InputGroup>
                <InputGroup className="mb-3">
                    <Dropdown>
                        <Dropdown.Toggle variant="success" id="dropdown-basic">
                            {selectedExpencePlace.name as string}
                        </Dropdown.Toggle>
                        <Dropdown.Menu >
                        { expencePlaceList.map((expencePlace, index) => 
                            <Dropdown.Item  key={'Expence_Place_Menu' + index} href="#" onClick={e => setSelectedExpencePlace({...selectedExpencePlace, id: expencePlace.id as number, name:expencePlace.name as string})}>
                                {expencePlace.name}
                            </Dropdown.Item>)}
                        </Dropdown.Menu>
                    </Dropdown>
                </InputGroup>
                <InputGroup className="mb-3">
                    <Dropdown>
                        <Dropdown.Toggle variant="success" id="dropdown-basic">
                            {selectedUser.name as string}
                        </Dropdown.Toggle>
                        <Dropdown.Menu >
                        { userList.map((user, index) => 
                            <Dropdown.Item  key={'Usere_Menu' + index} href="#" onClick={e => setSelectedUser({...selectedUser, id: user.id as number, name: user.firstName as string})}>
                                {user.firstName} {user.middleName} {user.lastName}
                            </Dropdown.Item>)}
                        </Dropdown.Menu>
                    </Dropdown>
                </InputGroup>
                <InputGroup>
                {
                (isLoadingExpencePlaces || isLoadingUsers) ?
                    <Button variant="outline-secondary" disabled>
                        <Spinner
                        as="span"
                        animation="grow"
                        size="sm"
                        role="status"
                        aria-hidden="true"
                        />
                        Loading...
                    </Button>
                    :
                    <Button variant="outline-secondary" type="submit" 
                    onClick={() => {
                        if( selectedExpencePlace.id > 0 && selectedUser.id > 0){
                            formData.expencePlaceId = selectedExpencePlace.id;
                            formData.userId = selectedUser.id;
                            onCreatePressed(formData);
                            setFormData({...formData, total: 0.0, totalDiscount: 0.0, userId: 0, paymentDate: null, isAutomatedPayment: false, expencePlaceId: 0});
                        }                        
                    }}>Save</Button>
                }
                </InputGroup>
            </InputGroup>
        </div>
    );
};

const mapStateToProps = (state:any) => ({
    isLoadingExpencePlaces: getExpencePlaceListLoading(state),
    expencePlaceList: getExpencePlaceList(state),
    isLoadingUsers: getUserListLoading(state),
    userList: getUserList(state),
});

const mapDispatchToProps = (dispatch:any) => ({
    onCreatePressed: (formData: any) => dispatch(addOrder(formData)),
});

export default connect(mapStateToProps, mapDispatchToProps)(OrderForm);
