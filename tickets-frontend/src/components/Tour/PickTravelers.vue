<template>
  <div>
    <v-row align="center" class="text-body-2">
      <v-col>
        <span>{{ adultsQuantity }}</span>
      </v-col>
      <v-col>
        <span class="pr-2">x</span>
        <span class="secondary--text text--darken-1">{{ price_adult }} VND</span>
      </v-col>
      <v-col>
        <TrnPickNumber
          ref="adults"
          v-model="adults"
          :num="adults"
          v-on="$listeners"
          @changeValue="(value) => (adults = value)"
        />
      </v-col>
    </v-row>

    <v-row align="center" class="text-body-2">
      <v-col>
        <span>{{ childrenQuantity }}</span>
      </v-col>

      <v-col>
        <span class="pr-2">x</span>
        <span class="secondary--text text--darken-1">
          {{ price_children }} VND</span
        >
      </v-col>
      <v-col>
        <TrnPickNumber
          ref="childrens"
          v-model="children"
          :num="children"
          v-on="$listeners"
          @changeValue="(value) => (children = value)"
        />
      </v-col>
    </v-row>
    <v-row class="justify-center">
      <div style="display: flex">
        <v-text-field
          v-model="coupon"
          style="margin: 0 15px"
          hide-details="auto"
          label="Phiếu giảm giá"
        />
        <v-btn class="btnBookTour" @click="applyCoupon">Áp dụng</v-btn>
      </div>
    </v-row>
    <v-row class="justify-center">
      <v-btn class="btnBookTour" @click="bookTour">Đặt vé</v-btn>
    </v-row>
    <v-dialog v-model="dialog" width="500">
      <v-card>
        <v-card-title class="text-h5 grey lighten-2"> Thanh toán </v-card-title>
        <v-card-text>
          <v-img src="https://scontent.fhan2-4.fna.fbcdn.net/v/t1.15752-9/363305705_2279522055575263_4244699414063210188_n.jpg?_nc_cat=110&cb=99be929b-59f725be&ccb=1-7&_nc_sid=ae9488&_nc_ohc=k2g21BNToh8AX9x5FFB&_nc_ht=scontent.fhan2-4.fna&oh=03_AdQwAKAXHREqYemcGu4ROOHeamowzW6Ozly-0AgiT-1CMw&oe=64E89909" max-width="690"></v-img>
          Nội dung thanh toán:mã đặt hàng {{ orderCode }}
          <br>Bạn đã đặt vé thành công với mã đặt hàng {{ orderCode }}.
        </v-card-text>

        <v-divider />

        <v-card-actions>
          <v-spacer />
          <router-link to="/user/profile">
            <v-btn color="primary" text @click="dialog = false"> OK </v-btn>
          </router-link>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex';
  import pluralize from '@/common/pluralize.js';
  import orderApi from '@/common/service/order.api';
  import Swal from 'sweetalert2';
  import TrnPickNumber from './PickNumber';

  export default {
    components: {
      TrnPickNumber,
    },
    props: {
      price_adult: {
        type: Number,
        required: true,
      },
      price_children: {
        type: Number,
        required: true,
      },
    },
    data: () => ({
      coupon: '',
      discount: 0,
      threshold: 0,
      orderCode: 0,
      adults: 1,
      children: 0,
      data_send: {
        tour_id: 1,
        user_id: 1,
        child_count: 0,
        adult_count: 0,
        total_price: 0,
        tax: 10,
        payment_method: 'cod',
        status: 'active',
      },
      dialog: false,
    }),
    computed: {
      adultsQuantity() {
        return this.adults+ ' Người lớn';
      },
      childrenQuantity() {
        return this.children+ ' Trẻ em';
      },
      ...mapGetters(['currentUser']),
    },
    methods: {
      async applyCoupon() {
        await this.checkValidCouponCode(this.coupon).then((resp) => {
          if (resp.data === 'not exist') {
            Swal.fire({
              text: 'Mã giảm giá không tồn tại hoặc đã hết số lượt sử dụng',
              icon: 'error',
            });
            this.coupon = '';
          } else {
            this.threshold = resp.data[0].threshold;
            this.discount = resp.data[0].discount;
            Swal.fire({
              text: 'Mã giảm giá đã được áp dụng cho chuyến đi của bạn',
              icon: 'success',
            });
          }
        });
      },

      async checkValidCouponCode(couponCode) {
        const data = await orderApi.checkValidCouponCode(couponCode);
        console.log(data);
        return data;
      },
      totalPrice(count1, price1, count2, price2, discountPercent, threshold) {
        const sum = count1 * price1 + count2 * price2;
        if (this.coupon === '') {
          return sum;
        }
        return (sum * discountPercent) / 100 > threshold
          ? sum - threshold
          : sum - (sum * discountPercent) / 100;
      },
      async bookTour() {
        if (this.currentUser != null) {
          await orderApi
            .bookTour({
              ...this.data_send,
              tour_id: this.$route.params.id,
              user_id: this.currentUser.id,
              child_count: this.children,
              adult_count: this.adults,
              total_price: this.totalPrice(
                this.children,
                this.price_children,
                this.adults,
                this.price_adult,
                this.discount,
                this.threshold
              ),
            })
            .then((response) => {
              if (response.status === 200) {
                this.dialog = true;
                this.orderCode = response.data.data.id;
              } else if (response.status === 422) {
                Swal.fire({
                  text: 'Bạn cần điền đầy đủ thông tin',
                  icon: 'error',
                });
              }
            })
            .catch((e) => {
              console.log(this.data_send);
              Swal.fire({
                text: 'Bạn chưa đăng nhập',
                icon: 'error',
              });
            });
        } else {
          await Swal.fire({
            text: 'Bạn chưa đăng nhập',
            icon: 'error',
          });
        }
      },
    },
  };
</script>

<style scoped>
  .btnBookTour {
    background-color: #ff9800 !important;
    color: #ffffff;
    border-radius: 4px;
    margin: 10px 0;
  }
</style>
