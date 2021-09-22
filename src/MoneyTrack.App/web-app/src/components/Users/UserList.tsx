import React, { useEffect } from 'react';
import { connect, useDispatch } from 'react-redux';
import { ListGroup } from 'react-bootstrap';
import {
    getUserList,
    getUserListLoading,
} from './selectors';
import { UserResponse } from "../../clients/src/clients";
import { Spinner } from 'react-bootstrap';
import UserForm from './UserForm';
import UserItem from './UserItem';
import { loadUserList, removeUserRequest } from './thunks';

const UserList = ({  userList, isLoading, onRemovePressed }
    :{  userList:UserResponse[], isLoading:any, onRemovePressed:any }) => {
    
    const dispatch = useDispatch();
    useEffect(() => {
        dispatch(loadUserList());
    }, [dispatch]);
    
    const loadingMessage = <div> <Spinner
                                    as="span"
                                    animation="border"
                                    size="sm"
                                    role="status"
                                    aria-hidden="true"
                                /> Loading...</div>;
    const content = (

        <div>            
            <UserForm />
            <h3>Users:</h3>
            {userList.map((user, index) => 
                <ListGroup as="ul" key={'userList' + index}>
                    <UserItem
                        key={user.id}
                        user={user}
                        onRemovePressed={onRemovePressed}/>
                </ListGroup>)}
        </div>
    );
    return isLoading ? loadingMessage : content;
};

const mapStateToProps = (state:any) => ({
    isLoading: getUserListLoading(state),
    userList: getUserList(state),
});

const mapDispatchToProps = (dispatch:any) => ({
    onRemovePressed: (id:number) => dispatch(removeUserRequest(id)),
});

export default connect(mapStateToProps, mapDispatchToProps)(UserList);
