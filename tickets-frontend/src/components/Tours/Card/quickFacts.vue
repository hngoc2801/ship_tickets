<template>
  <v-container class="px-4 mt-6 pb-0">
    <HUMGRating
      class="mt-n8 pb-0"
      :rating="calcRating()"
      :reviews-quantity="calcRating(false)"
    />

    <HUMGHighlights
      class="py-1"
      :highlights="tour.dest.description"
      v-on="$listeners"
    />
    <HUMGDestinations class="py-1" :destinations="tour.dest.address_detail" />

    <HUMGTravelStyle
      class="py-1"
      :travel-style="tour.categories"
      v-on="$listeners"
    />
    <HUMGDuration class="py-2" :duration="tour.range" />
    <HUMGPrice :old-price="tour.price.adult * 1.5 " :price="tour.price.adult" />
  </v-container>
</template>

<script>
  import HUMGRating from './Rating.vue';
  import HUMGHighlights from './Highlights.vue';
  import HUMGDestinations from './Destinations.vue';
  import HUMGTravelStyle from './TravelStyle.vue';
  import HUMGDuration from './Duration.vue';
  import HUMGPrice from './Price.vue';

  export default {
    components: {
      HUMGRating,
      HUMGHighlights,
      HUMGDestinations,
      HUMGTravelStyle,
      HUMGDuration,
      HUMGPrice,
    },

    props: {
      tour: {
        type: Object,
        required: true,
      },
    },

    methods: {
      calcRating(isRating = true) {
        let ratingAvg = 0;
        const { reviews } = this.tour;
        const numberReviews = reviews.length;
        for (let i = 0; i < reviews.length; i += 1) {
          const rating = reviews[i].star;
          ratingAvg += rating;
        }

        ratingAvg /= numberReviews;
        if (isRating) {
          return ratingAvg;
        }

        return numberReviews;
      },
    },
  };
</script>

<style scoped></style>
