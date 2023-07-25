<template>
  <div class="my-6">
    <div>Thông tin về tàu thuyền!</div>

    <v-row>
      <v-col
        v-for="(point, i) in bookFlexibility"
        :key="i"
        class="d-flex align-center"
        cols="12"
        md="6"
      >
        <TrnBulletPoint
          :icon="point.icon"
          :title="point.title"
          :content="point.content"
        />
      </v-col>
    </v-row>
  </div>
</template>

<script>
  import TrnBulletPoint from '@/components/base/BulletPoint.vue';

  export default {
    components: {
      TrnBulletPoint,
    },
    props: {
      item: {
        type: Object,
        required: true,
      },
    },
    mounted() {
      console.log(this.item);
      this.bookFlexibility = [
        {
          icon: 'mdi-hospital-box-outline',
          title: 'Số người tham gia',
          content: `Số người đăng ký tối đa là ${this.item.max_slot}, số người đã đăng ký là ${this.item.slot}`,
        },
        {
          icon: 'mdi-star-face',
          title: 'Loại tàu',
          content: `Tàu ${this.item.hotel_star} sao`,
        },
        {
          icon: 'mdi-halloween',
          title: 'Nhân viên',
          content: `${this.item.tour_guide.name}`,
        },
      ]
    },
    data: () => ({
      bookFlexibility: [],
    }),
  };
</script>

<style scoped></style>
