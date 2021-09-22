export const getExpenceList = (state, orderId) => state.expenceList.data[orderId] ? state.expenceList.data[orderId].list : [];
export const getExpenceListLoading = (state, orderId) => { return state.expenceList.data[orderId] ? state.expenceList.data[orderId].isLoading : true };
