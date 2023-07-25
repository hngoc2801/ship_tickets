<template>
  <div>
    <TrnFilter />
    <div v-if="isPlacesLoading" class="text-center TrnLoading mb-3">
      <HUMGLoadingAnimation />
    </div>
    <div v-else>
      <div v-if="returnedPlace === 0" class="text-center text-h5 TrnLoading">
        <HUMGCompass style="font-size: 6em" />
        <br />
        Không có kết quả
        <br />
        Vui lòng xóa toàn bộ bộ lọc, tìm kiếm và tiến hành lại
      </div>
      <div v-else>
        <v-row align="center" justify="center">
          <v-col>
            <HUMGSort class="pb-2 pt-0" />
          </v-col>

          <v-col class="text-center text-body-1 primary--text">
            Tìm thấy
            <span class="font-weight-medium secondary--text text--darken-1">{{
              placeQuantity
            }}</span>
            cho bạn
          </v-col>
          <v-col class="text-right">
            <HUMGPagination
              v-if="totalPlace"
              no-button
              :length="pageQuantity"
              :returned="returnedPlace"
              :total="totalPlace"
            />
          </v-col>
        </v-row>

        <stack
          ref="stackRef"
          :column-min-width="320"
          :gutter-width="30"
          :gutter-height="40"
          :monitor-images-loaded="true"
        >
          <stack-item
            v-for="(place, i) in places"
            :key="i"
            style="transition: transform 1000ms"
            :class="$vuetify.breakpoint.xs ? 'TrnGridMobile' : ''"
          >
            <HUMGCard :place="place" @reload-grid="reloadGrid" />
          </stack-item>
        </stack>

        <HUMGPagination
          v-if="totalPlace"
          class="text-center"
          :length="pageQuantity"
          :returned="returnedPlace"
          :total="totalPlace"
        />
      </div>
    </div>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex';
  import { Stack, StackItem } from 'vue-stack-grid';
  import { FETCH_PLACES } from '@/store/type/actions';

  import HUMGSort from '@/components/Tours/Sort.vue';
  import HUMGFilter from '@/components/Tours/Filter/FitlerPlaces.vue';
  import HUMGPagination from '@/components/Places/Pagination.vue';
  import HUMGCard from '@/components/Places/Card/Card.vue';

  import HUMGLoadingAnimation from '@/components/core/LoadingAnimation.vue';
  import HUMGCompass from '@/components/base/Compass';

  import pluralize from '@/common/pluralize.js';
  import { APP_ITEMS_PER_PAGE } from '@/common/config.js';

  export default {
    components: {
      HUMGSort,
      TrnFilter: HUMGFilter,
      Stack,
      StackItem,
      HUMGCard,
      HUMGPagination,
      HUMGLoadingAnimation,
      HUMGCompass,
    },

    computed: {
      ...mapGetters([
        'isPlacesLoading',
        'places',
        'totalPlace',
        'returnedPlace',
      ]),
      placeQuantity() {
        return this.totalPlace+ ' Địa điểm';
      },
      pageQuantity() {
        return Math.ceil(this.totalPlace / APP_ITEMS_PER_PAGE);
      },
    },

    watch: {
      $route: {
        handler: 'fetchPlaces',
        immediate: true,
      },
    },

    methods: {
      reloadGrid() {
        this.$nextTick(() => {
          if (this.$refs.stackRef) this.$refs.stackRef.reflow();
        });
      },

      async fetchPlaces() {
        await this.$store.dispatch(FETCH_PLACES, this.$route.query);
      },
    },
  };
</script>

<style>
  .TrnLoading {
    /* margin-top: 1vh; */
    height: 500px;
  }
  .TrnGridMobile {
    max-width: 350px;
    left: 0;
    right: 0;
    margin-left: auto;
    margin-right: auto;
  }

  .trn-no-border.v-text-field > .v-input__control > .v-input__slot:before {
    border-style: none;
  }
  .trn-no-border.v-text-field > .v-input__control > .v-input__slot:after {
    border-style: none;
  }
</style>
