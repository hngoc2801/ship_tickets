<template>
  <div class="app-container">
    <el-input v-model="filterText" placeholder="Filter keyword" style="margin-bottom:30px;" />

    <el-tree
      ref="tree2"
      :data="data2"
      :props="defaultProps"
      :filter-node-method="filterNode"
      class="filter-tree"
      default-expand-all
    />

  </div>
</template>

<script>
export default {

  data() {
    return {
      filterText: '',
      data2: [{
        id: 1,
        label: 'Quản trị viên',
        children: [{
          id: 4,
          label: 'Người quản lý'
        }]
      }, {
        id: 3,
        label: 'Người dùng',
        children: [{
          id: 7,
          label: 'Danh sách vé tàu, đánh giá'
        }, {
          id: 8,
          label: 'Danh sách địa điểm, đánh giá'
        }]
      }, {
        id: 4,
        label: 'Khách chưa đăng nhập',
        children: [{
          id: 7,
          label: 'Danh sách vé tàu'
        }, {
          id: 8,
          label: 'Danh sách địa điểm'
        }]
      }],
      defaultProps: {
        children: 'children',
        label: 'label'
      }
    }
  },
  watch: {
    filterText(val) {
      this.$refs.tree2.filter(val)
    }
  },

  methods: {
    filterNode(value, data) {
      if (!value) return true
      return data.label.indexOf(value) !== -1
    }
  }
}
</script>

