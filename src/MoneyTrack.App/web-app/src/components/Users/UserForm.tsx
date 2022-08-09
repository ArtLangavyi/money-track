import React, { useState } from 'react';
import { connect } from 'react-redux';
import { Button, InputGroup, Form } from 'react-bootstrap';
import { UserResponse } from "../../clients/src/clients";
import { getUserListLoading, getUserList } from './selectors';
import { addUser } from './thunks';

const UserForm = ({ userList, onCreatePressed }: { userList:UserResponse[], onCreatePressed:any }) => {
    const [formData, setFormData] = useState({
        firstName: '',
        middleName: '',
        lastName: ''
      });

    return (
        <div>
            <InputGroup className="mb-3">
                <Form.Control
                name="firstName" 
                type="text"
                placeholder="First name"
                aria-label="First name"
                aria-describedby="basic-addon2"
                onChange={e => setFormData({...formData, firstName: e.target.value})}
                required
                />
                <InputGroup>
                    <Form.Control
                    name="middleName" 
                    type="text"
                    placeholder="Middle name"
                    aria-label="Middle name"
                    aria-describedby="basic-addon2"
                    onChange={e => setFormData({...formData, middleName: e.target.value})}
                    required
                    />
                </InputGroup>
                <InputGroup>
                    <Form.Control
                    name="lastName" 
                    type="text"
                    placeholder="Last name"
                    aria-label="Last name"
                    aria-describedby="basic-addon2"
                    onChange={e => setFormData({...formData, lastName: e.target.value})}
                    required
                    />
                </InputGroup>
                <InputGroup>
                <Button variant="outline-secondary" type="submit" 
                onClick={() => {
                    const isDuplicateText =
                    userList.some(user => user.firstName === formData.firstName && user.lastName === formData.lastName);
                    if (!isDuplicateText) {
                        onCreatePressed(formData);
                        setFormData({...formData, firstName: '', middleName: '', lastName: ''})
                    }
                }}>Save</Button>
                </InputGroup>
            </InputGroup>
        </div>
    );
};

const mapStateToProps = (state:any) => ({
    isLoadingUsers: getUserListLoading(state),
    userList: getUserList(state),
});

const mapDispatchToProps = (dispatch:any) => ({
    onCreatePressed: (formData: any) => dispatch(addUser(formData)),
});

export default connect(mapStateToProps, mapDispatchToProps)(UserForm);