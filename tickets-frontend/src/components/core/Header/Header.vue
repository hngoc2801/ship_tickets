<template>
  <v-app-bar color="#003C71CC" app absolute>
    <v-container>
      <v-row align="center" class="mx-1">
        <v-app-bar-nav-icon left class="hidden-md-and-up mx-n4" />
        <router-link
          style="text-decoration: none"
          class="text-h5 text-md-h4 text-sm-center white--text px-2 py-1"
          :to="'/'"
        >
          <v-img
            class="logo_humg"
            width="62"
            alt="tourino logo"
            :src="require('@/assets/HUMG.png')"
          />
        </router-link>

        <v-spacer />
        <v-btn
          v-for="(item, i) in menu"
          :key="i"
          large
          class="hidden-sm-and-down white--text text-subtitle-1 mr-5"
          text
          rounded
          :to="item.route"
        >
          <v-icon left>{{ item.icon }}</v-icon>
          {{ item.text }}
        </v-btn>

        <HUMGUserMenu v-if="isAuthenticated" />
        <HUMGAuthMenu v-else />
      </v-row>
    </v-container>
  </v-app-bar>
</template>

<script>
  import { mapGetters } from 'vuex';

  import HUMGAuthMenu from './Auth/AuthMenu.vue';
  import HUMGUserMenu from './User/UserMenu.vue';

  export default {
    name: 'TrnHeader',
    components: {
      HUMGAuthMenu,
      HUMGUserMenu,
    },
    data: () => ({
      authMenu: false,
      menu: [
        {
          icon: 'mdi-compass',
          text: 'vé tàu thuyền',
          route: '/tickets',
        },
        {
          icon: 'mdi-map-marker',
          text: 'Địa điểm',
          route: '/places',
        },
      ],
    }),
    computed: {
      ...mapGetters(['isAuthenticated']),
    },
  };
</script>

<style scoped>
  .TrnLogoMobile {
    max-width: 150px;
  }

  .TrnLogo {
    max-width: 230px;
  }
</style>
