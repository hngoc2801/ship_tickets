<template>
  <HUMGBaseCard class="grid-card" style="max-width: 400px">
    <div class="card-header">
      <router-link :to="'/place/' + place.id">
        <v-img
          aspect-ratio="1.4"
          class="white--text align-end rounded-tr-xl"
          :src="place.images[0]"
        />
        <HUMGCardName :name="place.name" />
      </router-link>
    </div>

    <HUMGQuickFacts :place="place" style="font-size: 14px" v-on="$listeners" />
  </HUMGBaseCard>
</template>

<script>
  import HUMGBaseCard from '@/components/base/Card';
  import HUMGCardName from './CardName.vue';
  import HUMGSavingRibbon from './SavingRibbon.vue';
  import HUMGQuickFacts from './quickFacts.vue';

  export default {
    components: {
      HUMGCardName,
      HUMGBaseCard,
      HUMGQuickFacts,
    },

    props: {
      place: {
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
