import React, { useEffect } from 'react';
import { connect, useDispatch } from 'react-redux';
import { ListGroup } from 'react-bootstrap';
import {
    getExpencePlaceList,
    getExpencePlaceListLoading,
} from './selectors';
import { ExpencePlaceResponse } from "../../../clients/src/clients";
import { Spinner } from 'react-bootstrap';
import ExpencePlaceForm from './ExpencePlaceForm';
import ExpencePlaceItem from './ExpencePlaceItem';
import { loadExpencePlaceList, removeExpencePlaceRequest } from './thunks';

const ExpencePlaceList = ({  expencePlaceList, isLoading, onRemovePressed }
    :{  expencePlaceList:ExpencePlaceResponse[], isLoading:any, onRemovePressed:any }) => {
    
    const dispatch = useDispatch();
    useEffect(() => {
        dispatch(loadExpencePlaceList());
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
            <ExpencePlaceForm />
            <h3>Expence Places:</h3>
            {expencePlaceList.map((expencePlace, index) => 
                <ListGroup as="ul" key={'expencePlaceList' + index}>
                    <ExpencePlaceItem
                        key={expencePlace.id}
                        expencePlace={expencePlace}
                        onRemovePressed={onRemovePressed}/>
                </ListGroup>)}
        </div>
    );
    return isLoading ? loadingMessage : content;
};

const mapStateToProps = (state:any) => ({
    isLoading: getExpencePlaceListLoading(state),
    expencePlaceList: getExpencePlaceList(state),
});

const mapDispatchToProps = (dispatch:any) => ({
    onRemovePressed: (id:number) => dispatch(removeExpencePlaceRequest(id)),
});

export default connect(mapStateToProps, mapDispatchToProps)(ExpencePlaceList);
