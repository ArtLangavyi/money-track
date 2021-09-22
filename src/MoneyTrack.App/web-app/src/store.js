import { createStore, combineReducers, applyMiddleware } from 'redux';
import { persistReducer } from 'redux-persist';
import storage from 'redux-persist/lib/storage';
import autoMergeLevel2 from 'redux-persist/lib/stateReconciler/autoMergeLevel2';
import thunk from 'redux-thunk';
import { composeWithDevTools } from 'redux-devtools-extension';
import { productTypeList } from './components/Product/Type/reducers';
import { productList } from './components/Product/reducers';
import { userList } from './components/Users/reducers';
import { orderList } from './components/Orders/reducers';
import { expencePlaceList } from './components/Expence/Place/reducers';
import { expenceList } from './components/Expence/reducers';

const reducers = {
    productTypeList,
    productList,
    userList,
    orderList,
    expencePlaceList,
    expenceList,
};

const persistConfig = {
    key: 'root',
    storage,
    stateReconciler: autoMergeLevel2,
}

const rootReducer = combineReducers(reducers);
const persistedReducer = persistReducer(persistConfig, rootReducer);

export const configureStore = () =>
    createStore(
        persistedReducer,
        composeWithDevTools(
            applyMiddleware(thunk)
        )
    );