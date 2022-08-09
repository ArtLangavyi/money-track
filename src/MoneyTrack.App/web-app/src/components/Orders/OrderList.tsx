import React, { useEffect } from 'react';
import { connect, useDispatch } from 'react-redux';
import { ListGroup, Accordion } from 'react-bootstrap';
import {
    getOrderList,
    getOrderListLoading,
} from './selectors';
import { OrderResponse } from "../../clients/src/clients";
import { Spinner } from 'react-bootstrap';
import OrderForm from './OrderForm';
import OrderItem from './OrderItem';
import { loadOrderList, removeOrderRequest } from './thunks';

const OrderList = ({  orderList, isLoading, onRemovePressed }
    :{  orderList:OrderResponse[], isLoading:any, onRemovePressed:any }) => {
    
    const dispatch = useDispatch();
    useEffect(() => {
        dispatch(loadOrderList() as any);
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
            <OrderForm />
            <h3>Orders:</h3>
            {orderList.map((order, index) => 
                <Accordion key={'orderList_' + index} defaultActiveKey={String(order.id)}>
                    <OrderItem
                        key={order.id}
                        eventKey={String(order.id)}
                        order={order}
                        onRemovePressed={onRemovePressed}/>
                </Accordion>)}
        </div>
    );
    return isLoading ? loadingMessage : content;
};

const mapStateToProps = (state:any) => ({
    isLoading: getOrderListLoading(state),
    orderList: getOrderList(state),
});

const mapDispatchToProps = (dispatch:any) => ({
    onRemovePressed: (id:number) => dispatch(removeOrderRequest(id)),
});

export default connect(mapStateToProps, mapDispatchToProps)(OrderList);
