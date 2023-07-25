<template>

</template>

<script>
  import syncSelectionWithUrl from './mixins/syncSelectionWithUrl';
  import { multipleSelection } from './mixins/selection';

  export default {
    mixins: [syncSelectionWithUrl('duration'), multipleSelection('duration')],

    data: () => ({
      duration: [
        { value: ['1', '5'], label: '1 - 5 ngày' },
        { value: ['6', '10'], label: '6 - 10 ngày' },
        { value: ['11', '15'], label: '11 - 15 ngày' },
        { value: ['16', '20'], label: '16 - 20 ngày' },
        { value: ['21'], label: '21+ ngày' },
      ],
      selection: '',
    }),
  };
</script>
