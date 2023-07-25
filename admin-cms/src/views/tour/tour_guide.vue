<template>
  <div class="app-container">
    <div class="header-container">
      <el-button class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-edit" @click="handleCreate()">
        Thêm
      </el-button>
    </div>
    <br />
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
      <el-table-column label="Số điện thoại">
        <template slot-scope="scope">
          <span>{{ scope.row.phone_number }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Địa chỉ">
        <template slot-scope="scope">
          <span>{{ scope.row.address }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Hoạt động" align="center" width="300" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button type="primary" size="mini" @click="handleUpdate(scope.$index)">
            Sửa
          </el-button>
          <el-button size="mini" type="danger" @click="handleDelete(scope.$index)">
            Xóa
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog title="Nhân viên" :visible.sync="dialogFormVisible">
      <el-form ref="dataForm" :model="tourGuide" label-position="left" style="width: 400px; margin-left:50px;">
        <el-form-item label="Tên" prop="title">
          <el-input v-model="tourGuide.name" />
        </el-form-item>
        <el-form-item label="Địa chỉ" prop="description">
          <el-input v-model="tourGuide.phone_number" />
        </el-form-item>
        <el-form-item label="Số điện thoại" prop="description">
          <el-input v-model="tourGuide.address" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">
          Cancel
        </el-button>
        <el-button v-if="!dialogCreate" type="primary" @click="updateCategory(tourGuide)">
          Sửa
        </el-button>
        <el-button v-if="dialogCreate" type="primary" @click="createCategory(tourGuide)">
          Thêm
        </el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import { getListTourGuide, updateTourGuide, createTourGuide, deleteTourGuides } from '@/api/tour_guide'

export default {
  data() {
    return {
      list: null,
      tourGuide: null,
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
      getListTourGuide().then(response => {
        this.list = response.data
        if (this.list.length > 0) {
          this.tourGuide = this.list[0]
        } else {
          this.tourGuide = {
            name: '',
            description: ''
          }
        }
        this.listLoading = false
      })
    },
    updateCategory(category) {
      updateTourGuide(category).then(
        response => {
          if (response.code === 0) {
            this.$notify({
              message: 'Sửa thành công',
              type: 'success'
            })
            this.dialogFormVisible = false
          }
        }
      )
    },
    createCategory(category) {
      createTourGuide(category).then(
        response => {
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
      this.tourGuide = this.list[index]
      this.dialogFormVisible = true
      this.dialogCreate = false
    },
    handleDelete(index) {
      deleteTourGuides({
        id: this.list[index].id
      }).then(
        response => {
          if (response.code === 0) {
            this.$notify({
              message: 'Sửa thành công',
              type: 'success'
            })
            this.fetchData()
          }
        }
      )
    },
    handleCreate() {
      this.tourGuide = {
        name: null,
        phone_number: null,
        address: null
      }
      this.dialogFormVisible = true
      this.dialogCreate = true
    }
  }
}
</script>
