<template>
  <div class="app-container">
    <div class="header-container">
      <el-button
        class="filter-item"
        style="margin-left: 10px"
        type="primary"
        icon="el-icon-edit"
        @click="handleCreate()"
      >
        Thêm
      </el-button>
    </div>
    <br>
    <el-table
      v-loading="listLoading"
      :data="list"
      element-loading-text="Loading"
      border
      fit
      highlight-current-row
    >
      <el-table-column align="center" label="Mã" width="95">
        <template slot-scope="scope">
          {{ scope.$index }}
        </template>
      </el-table-column>
      <el-table-column label="Tên" width="200">
        <template slot-scope="scope">
          {{ scope.row.name }}
        </template>
      </el-table-column>
      <el-table-column label="Mô tả">
        <template slot-scope="scope">
          <span>{{ scope.row.description }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="Hoạt động"
        align="center"
        width="300"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            type="primary"
            size="mini"
            @click="handleUpdate(scope.$index)"
          >
            Sửa
          </el-button>
          <el-button
            size="mini"
            type="danger"
            @click="handleDelete(scope.$index)"
          >
            Xóa
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog title="Danh mục" :visible.sync="dialogFormVisible">
      <el-form
        ref="dataForm"
        :model="category"
        label-position="left"
        style="width: 400px; margin-left: 50px"
      >
        <el-form-item label="Tên" prop="title">
          <el-input v-model="category.name" />
        </el-form-item>
        <el-form-item label="Mô tả" prop="description">
          <el-input v-model="category.description" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false"> Hủy </el-button>
        <el-button
          v-if="!dialogCreate"
          type="primary"
          @click="updateCategory(category)"
        >
          Sửa
        </el-button>
        <el-button
          v-if="dialogCreate"
          type="primary"
          @click="createCategory(category)"
        >
          Thêm
        </el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  getListCategory,
  updateCategory,
  deleteCategory,
  createCategory
} from '@/api/category'

export default {
  data() {
    return {
      list: null,
      category: { name: '', category: '' },
      listLoading: true,
      dialogFormVisible: false,
      dialogCreate: false
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    fetchData() {
      this.listLoading = true
      getListCategory().then((response) => {
        this.list = response.data
        console.log(this.list[0])
        if (this.list.length > 0) {
          this.category = this.list[0]
        } else {
          this.category = {
            name: '',
            description: ''
          }
        }
        this.listLoading = false
      })
    },
    updateCategory(category) {
      updateCategory(category).then((response) => {
        if (response.code === 0) {
          this.$notify({
            message: 'Sửa thành công',
            type: 'success'
          })
          this.dialogFormVisible = false
        }
      })
    },
    createCategory(category) {
      createCategory(category).then((response) => {
        if (response.code === 0) {
          this.$notify({
            message: 'Thêm thành công',
            type: 'success'
          })
          this.dialogFormVisible = false
          this.fetchData()
        }
      })
    },
    handleUpdate(index) {
      this.category = this.list[index]
      this.dialogFormVisible = true
      this.dialogCreate = false
    },
    handleDelete(index) {
      deleteCategory({
        id: this.list[index].id
      }).then((response) => {
        if (response.code === 0) {
          this.$notify({
            message: 'Sửa thành công',
            type: 'success'
          })
          this.fetchData()
        }
      })
    },
    handleCreate() {
      this.category = {
        name: null,
        description: null
      }
      this.dialogFormVisible = true
      this.dialogCreate = true
    }
  }
}
</script>
