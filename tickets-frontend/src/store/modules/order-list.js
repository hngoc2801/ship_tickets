import OrdersService from '@/common/service/order.api';

import { FETCH_ORDERS } from '../type/actions';
import { FETCH_START, FETCH_ORDER_END } from '../type/mutations';

const state = () => ({
  orders: [],
  users_tickets: [],
});

const getters = {
  orders: (state) => state.orders,
  users_tickets: (state) => state.users_tickets,
};

const actions = {
  // fetch all tour
  [FETCH_ORDERS]: async ({ commit }, query) => {
    commit(FETCH_START);
    const response = await OrdersService.listTour(query);
    console.log(response);
    console.log(response.data.user_id);

    // set state: tickets, totalPlace
    if (response) commit(FETCH_ORDER_END, response.data);
  },
};

const mutations = {
  [FETCH_ORDER_END](state, response) {
    state.orders = response.data;
    // state.users_tickets.push([{"user_id":response.data}])
  },
};

export default {
  state,
  getters,
  actions,
  mutations,
};
