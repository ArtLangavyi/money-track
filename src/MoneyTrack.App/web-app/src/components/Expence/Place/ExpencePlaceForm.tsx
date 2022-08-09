import React, { useState } from 'react';
import { connect } from 'react-redux';
import { Button, InputGroup, Form } from 'react-bootstrap';
import { ExpencePlaceResponse } from "../../../clients/src/clients";
import { getExpencePlaceList } from './selectors';
import { addExpencePlace } from './thunks';

const ExpencePlaceForm = ({ expencePlaceList, onCreatePressed }: { expencePlaceList:ExpencePlaceResponse[], onCreatePressed:any }) => {
    const [inputValue, setInputValue] = useState('');

    return (
        <div>
            <InputGroup className="mb-3">
                <Form.Control
                name="name" 
                type="text"
                placeholder="Expence place name"
                aria-label="Expence place name"
                aria-describedby="basic-addon2"
                onChange={e => setInputValue(e.target.value)}
                required
                />
                <InputGroup>
                <Button variant="outline-secondary" type="submit" 
                onClick={() => {
                    const isDuplicateText =
                    expencePlaceList.some(expencePlace => expencePlace.name === inputValue);
                    if (!isDuplicateText) {
                        onCreatePressed(inputValue);
                        setInputValue('');
                    }
                }}>Save</Button>
                </InputGroup>
            </InputGroup>
        </div>
    );
};

const mapStateToProps = (state:any) => ({
    expencePlaceList: getExpencePlaceList(state),
});

const mapDispatchToProps = (dispatch:any) => ({
    onCreatePressed: (text: string) => dispatch(addExpencePlace(text)),
});

export default connect(mapStateToProps, mapDispatchToProps)(ExpencePlaceForm);