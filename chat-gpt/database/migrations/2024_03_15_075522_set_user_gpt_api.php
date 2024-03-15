<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('set_user_gpt_api', function (Blueprint $table) {
            $table->id();
            $table->string('email');
            $table->string('API_KEY',255);
            $table->integer('status_active');
            $table->integer('is_deleted');
            $table->timestamp('inserted_date');
            $table->timestamp('update_date');
           
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
