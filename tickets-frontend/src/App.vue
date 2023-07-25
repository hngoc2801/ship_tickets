<template>
  <v-app>
    <HUMGAlert />
    <HUMGHeader />
    <v-main>
      <HUMGTransition>
        <router-view />
      </HUMGTransition>
    </v-main>
    <HUMGFooter />
    <HUMGCallHotline />
    <HUMGJumpTop />
  </v-app>
</template>

<script>
  import HUMGHeader from '@/components/core/Header/Header';
  import HUMGAlert from '@/components/core/Alert.vue';
  import HUMGCallHotline from '@/components/core/CallHotline';
  import HUMGJumpTop from '@/components/core/JumpTop.vue';
  import HUMGFooter from '@/components/core/Footer';

  export default {
    components: {
      HUMGHeader,
      HUMGFooter,
      HUMGCallHotline,
      HUMGAlert,
      HUMGJumpTop,
    },
  };
</script>

<style scoped>
  .v-card__text,
  .v-card__title {
    word-break: normal !important;
  }

  .v-application {
    background: linear-gradient(
        173deg,
        #29f8ff 0%,
        #f0feff 8%,
        #9aebffde 42%,
        #d5f4f6 50%,
        #c1ebf8 66%,
        #adf3ff 72%,
        #ddf4ff 83%,
        #65faff 100%
      )
      no-repeat center center fixed !important;
    background-size: cover !important;
  }
</style>
