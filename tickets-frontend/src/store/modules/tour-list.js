import ToursService from '@/common/service/tours.api';

import { FETCH_TOURS } from '../type/actions';
import { FETCH_START, FETCH_END } from '../type/mutations';

const state = () => ({
  tickets: [],
  total: undefined,
  returned: undefined,
  destinations: [],
  travelStyle: [],
  isToursLoading: true,
});

const getters = {
  tickets: (state) => state.tickets,
  total: (state) => state.total,
  returned: (state) => state.returned,

  isToursLoading: (state) => state.isToursLoading,
};

const actions = {
  // fetch all tour
  [FETCH_TOURS]: async ({ commit }, query) => {
    commit(FETCH_START);
    const response = await ToursService.getTour(query);

    // set state: tickets, total
    if (response) commit(FETCH_END, response.data);
  },
};

const mutations = {
  [FETCH_START](state) {
    state.isToursLoading = true;
  },

  [FETCH_END](state, response) {
    const totalLocal = response.total;

    state.tickets = response.data;
    state.total = totalLocal;
    state.returned = response.data.length;
    state.isToursLoading = false;
  },
};

export default {
  state,
  getters,
  actions,
  mutations,
};
