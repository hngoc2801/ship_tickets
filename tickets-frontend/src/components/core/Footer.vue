<template>
  <v-container style="z-index: 1">
    <v-footer class="py-3 footer__ve" absolute app color="primary" padless style="bottom:inherit">
      <v-row
        :justify="$vuetify.breakpoint.smAndDown ? 'center' : 'start'"
        :class="!$vuetify.breakpoint.smAndDown ? 'ml-16' : ''"
        class="primary white--text"
        no-gutters
      >
        <v-img
          max-width="130"
          class="ml-md-12"
          contain
          alt="tourino logo"
          src="../../assets/HUMG.png"
        />
        <p class="text-body-2" style="margin: auto 0.5em">
          <strong>©</strong> {{ new Date().getFullYear() }} HUMG
        </p>
      </v-row>
      <v-row justify="center" justify-md="end" no-gutters class="mr-md-16">
        <v-btn
          v-for="link in links"
    
          color="white"
          text
          rounded
          class="text-md-body-2 text-caption d-flex flex-column footer__btn"
          
        >
          <div      class="d-flex justify-content-start flex-column footer__btn ">
            {{ link }}
            <span class="fwe">{{ link =='Giới thiệu' ?" Mỗi chi tiết, mỗi sản phẩm đều là những" :"" }}</span>
            <span class="fwe">{{ link =='Giới thiệu' ?" dấu ấn, là câu chuyện mà chúng tôi" :"" }}</span>
            <span class="fwe">{{ link =='Giới thiệu' ?" muốn gửi gắm đến mỗi khách hàng.." :"" }}</span>
            <span class="fwe">{{ link =='Liên hệ' ?" Văn phòng GD: số 14 ngõ 773 đường Giải Phóng," :"" }}</span>
            <span class="fwe">{{ link =='Liên hệ' ?" phường Giáp Bát, quận Hoàng Mai, TP Hà Nội" :"" }}</span>
            <span class="fwe">{{ link =='Liên hệ' ?" Hotline: 0915.316.380" :"" }}</span>
            <span class="fwe">{{ link =='Liên hệ' ?" Email: info@viendongship.com" :"" }}</span>
            <span class="fwe">{{ link =='Điều khoản' ?`Chính sách & quy định` :"" }}</span>
            <span class="fwe">{{ link =='Điều khoản' ?`Bảo mật thông tin` :"" }}</span>
            <span class="fwe">{{ link =='Điều khoản' ?`Liên hệ` :"" }}</span>
          </div>
        </v-btn>
      </v-row>
    </v-footer>
  </v-container>
</template>

<script>
  export default {
    data: () => ({
      links: [
        'Giới thiệu',
        'Liên hệ',
        'Điều khoản',
      ],
    }),
  };
</script>
<style scoped>
.footer__btn>span{
  text-align: left;
  flex-direction: column !important;
  text-transform: none !important;
}
</style>