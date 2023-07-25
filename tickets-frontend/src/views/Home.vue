<template>
  <div>
    <HUMGCarousels class="mt-n16" :items="getFeaturedTours" link />
    <div class="TourList">
      <HUMGGrid />
    </div>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex';
  import HUMGCarousels from '@/components/Carousels.vue';

  import HUMGGrid from '@/components/Tours/Grid.vue';

  export default {
    name: 'Home',
    components: {
      HUMGCarousels,
      HUMGGrid,
    },
    computed: {
      ...mapGetters(['getFeaturedTours']),
    },
  };
</script>

<style scoped>
  .TourList {
    max-width: 1080px !important;
    margin: auto;
  }
</style>
