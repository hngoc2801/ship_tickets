<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterTableprices_ticketChangeAdultChild extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('prices_ticket', function (Blueprint $table) {
            $table->string('adult')->nullable()->change();
            $table->string('child')->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('prices_ticket', function (Blueprint $table) {
            //
        });
    }
}
