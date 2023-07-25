<template>
  <v-container class="px-4 mt-6 pb-0">
    <HUMGRating
      class="mt-n8 pb-0"
      :rating="calcRating()"
      :reviews-quantity="calcRating(false)"
    />

    <HUMGHighlights
      class="py-1"
      :highlights="place.description"
      v-on="$listeners"
    />
    <HUMGDestinations class="py-1" :destinations="place.address_detail" />
  </v-container>
</template>

<script>
  import HUMGRating from './Rating.vue';
  import HUMGHighlights from './Highlights.vue';
  import HUMGDestinations from './Destinations.vue';

  export default {
    components: {
      HUMGRating,
      HUMGHighlights,
      HUMGDestinations,
    },

    props: {
      place: {
        type: Object,
        required: true,
      },
    },

    methods: {
      calcRating(isRating = true) {
        let ratingAvg = 0;
        const { reviews } = this.place;
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
