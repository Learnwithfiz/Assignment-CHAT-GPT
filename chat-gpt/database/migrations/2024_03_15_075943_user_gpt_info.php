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
        Schema::create('user_gpt_info', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->string('gpt_search_info',1200)->charset(null)->collation(null);
            $table->string('question',500);
            $table->integer('status_active');
            $table->integer('is_deleted');
            $table->timestamp('inserted_date');    
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
