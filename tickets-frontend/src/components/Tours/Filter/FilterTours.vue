<template>
  <div>
    <v-row align="center">
      <HUMGSearch />
    </v-row>
    <v-row align="center" justify="center">
      <v-col cols="6">
        <HUMGDestinations />
      </v-col>

      <v-col cols="6">
        <HUMGTravelStyle />
      </v-col>
    </v-row>

    <v-row class="mt-1" justify="center">
      <v-col cols="6" align="center">
        <HUMGPrice />
      </v-col>

      <v-col cols="3">
        <HUMGRating />
      </v-col>

      <v-col cols="3">
        <HUMGDuration />
      </v-col>
    </v-row>
  </div>
</template>

<script>
  import HUMGSearch from './SearchTours';
  import HUMGDestinations from './Destinations';
  import HUMGTravelStyle from './TravelStyle';
  import HUMGPrice from './Price';
  import HUMGRating from './Rating';
  import HUMGDuration from './Duration';

  export default {
    components: {
      HUMGSearch,
      HUMGDestinations,
      HUMGTravelStyle,
      HUMGPrice,
      HUMGRating,
      HUMGDuration,
    },
  };
</script>

<style scoped></style>
