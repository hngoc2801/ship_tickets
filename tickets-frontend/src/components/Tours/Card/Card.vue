<template>
  <HUMGBaseCard class="grid-card" style="max-width: 400px">
    <div class="card-header">
      <router-link :to="'/tour/' + tour.id">
        <v-img
          aspect-ratio="1.4"
          class="white--text align-end rounded-tr-xl"
          :src="tour.dest.images[0]"
        >
          <HUMGSavingRibbon
            :price="tour.price.adult"
            :old-price="tour.price.adult "
        /></v-img>
        <HUMGCardName :name="tour.dest.name" />
      </router-link>
    </div>

    <HUMGQuickFacts :tour="tour" style="font-size: 14px" v-on="$listeners" />
  </HUMGBaseCard>
</template>

<script>
  import HUMGBaseCard from '@/components/base/Card';
  import HUMGCardName from './CardName.vue';
  import HUMGSavingRibbon from './SavingRibbon.vue';
  import HUMGQuickFacts from './quickFacts.vue';

  export default {
    components: {
      HUMGSavingRibbon,
      HUMGCardName,
      HUMGBaseCard,
      HUMGQuickFacts,
    },

    props: {
      tour: {
        type: Object,
        required: true,
      },
    },
  };
</script>

<style scoped>
  .card-header {
    position: relative;
    margin-bottom: 2em;
  }
</style>
