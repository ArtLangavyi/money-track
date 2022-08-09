import React, { useEffect } from 'react';
import { connect, useDispatch } from 'react-redux';
import { ListGroup } from 'react-bootstrap';
import {
    getExpenceList,
    getExpenceListLoading,
} from './selectors';
import { ExpenceResponse } from "../../clients/src/clients";
import { Spinner } from 'react-bootstrap';
import ExpenceItem from './ExpenceItem';
import { loadExpenceList, removeExpenceRequest } from './thunks';

const ExpenceList = ({ orderId, expenceList, isLoading, onRemovePressed }
    :{orderId: number, expenceList:ExpenceResponse[], isLoading:any, onRemovePressed:any }) => {
    
     const dispatch = useDispatch();
        
    useEffect(() => {
        dispatch(loadExpenceList(orderId) as any)
    }, [orderId, dispatch]);
    
    const loadingMessage = <div> <Spinner
                                    as="span"
                                    animation="border"
                                    size="sm"
                                    role="status"
                                    aria-hidden="true"
                                /> Loading...</div>;
    const content = (

        <div>            
            <h3>Expences:</h3>
            {expenceList.map((expence, index) => 
                <ListGroup as="ul" key={'expenceList_' + index}>
                    <ExpenceItem
                        key={expence.id}
                        expence={expence}
                        onRemovePressed={onRemovePressed}/>
                </ListGroup>)}
        </div>
    );
    return isLoading ? loadingMessage : content;
};

const mapStateToProps = (state:any, ownProps:any) => ({
    isLoading: getExpenceListLoading(state, ownProps.orderId),
    expenceList: getExpenceList(state, ownProps.orderId),
});

const mapDispatchToProps = (dispatch:any) => ({
    onRemovePressed: (id:number) => dispatch(removeExpenceRequest(id)),
});

export default connect(mapStateToProps, mapDispatchToProps)(ExpenceList);
