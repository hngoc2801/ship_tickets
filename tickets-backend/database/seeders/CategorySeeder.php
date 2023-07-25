<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('categories')->insert([
            ['name' => 'Hạng thương gia', 'description' => 'Hạng thương gia'],
            ['name' => 'Hạng thường', 'description' => 'Hạng thường'],
        ]);
    }
}
