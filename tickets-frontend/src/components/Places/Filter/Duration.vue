<template>
  <v-select
    v-model="selection"
    hide-details
    item-text="label"
    :items="duration"
    prepend-icon="mdi-calendar-clock"
    label="Duration"
    :class="{ 'trn-no-border': hasSelectionValue() }"
  >
    <template #selection="{ item }">
      <v-chip color="primary" close @click:close="selection = ''">{{
        item.label
      }}</v-chip>
    </template>
  </v-select>
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
