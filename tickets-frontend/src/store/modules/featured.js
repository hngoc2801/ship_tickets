export default {
  state: {
    featuredTours: [
      {
        src:
          'https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547_1280.jpg',
        text: 'Tàu thuyền',
        link: 'nhatrang',
      },
      {
        src: 'https://images.pexels.com/photos/16817024/pexels-photo-16817024/free-photo-of-k-ngh-t-ng-y-du-l-ch.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        text: 'Tàu thuyền',
        link: 'tau',
      },
      {
        src: 'https://images.pexels.com/photos/173910/pexels-photo-173910.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        text: 'Tàu thuyền',
        link: 'tau',
      },
      {
        src:
          'https://images.pexels.com/photos/776030/pexels-photo-776030.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          text: 'Tàu thuyền',
          link: 'tau',
      },
      {
        src: 'https://images.pexels.com/photos/1589927/pexels-photo-1589927.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        text: 'Tàu thuyền',
        link: 'tau',
      },
    ],
  },
  getters: {
    getFeaturedTours: (state) => state.featuredTours,
  },
  mutations: {
    updateValue(state, payload) {
      state.value = payload;
    },
  },
  actions: {
    updateValue({ commit }, payload) {
      commit('updateValue', payload);
    },
  },
};
