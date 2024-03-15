

<?php
/**
 * Name: Mostafizur Rahman
 * Phone: 01718-465130
 * Email: mustafizur01739@gmail.com
 * project created date : 15-03-2024
 * Type: Assignment
 * Laravel : 10 
 * install Sanctum For Authentication
 * Develop Chat Gpt using CURL  And check User Authorized Or Un-Athorized
 * Useing POSTMAN 
 * If you need to write it down, use it: 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
 */
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

//** We are used two controller UserRegistration and For Authorization And result insert display uses SetChatGPTUser Controller  */
use App\Http\Controllers\UserRegistration ;
use App\Http\Controllers\SetChatGPTUser;
//** Controllers  */
 
//Implement user authentication using Laravel Sanctum.

Route::group(['middleware'=>'auth:sanctum'],function(){

     /** <=========display user info with set bearer token start here route  ===========>*/

      Route::get('/all-user',[UserRegistration::class,'OnAllUser']);
    
    /** <=========display user info with set bearer token ends here route  ===========>*/

    /** <=========set user CHAT-GPT API KEY Route Starts here ===========>*/
    Route::post('/chat-gpt-user',[SetChatGPTUser::class,'OnSetUserApiInfo']);
     /** <=========set user CHAT-GPT API KEY Route Ends here ===========>*/
     /*
      <=============== Most Important part here , Check CHAT GPT Token Verified User Authorized
       or Un-Authorized , If Authorized Then show Search Info otherWise Display Message: User Un-authorized;
       and Again User Authorized Insert Search Data mysql Table , Which User Login And Show Their user wise All Data
       ==========>
       For each request sent to the ChatGPT API, verify that the user is logged in/authenticated. 
       and display  If verification fails, return an unauthenticated error message.
       Save the result to the database, associating it with the authenticated user. This Route
     */

    Route::post('/chat-gpt-question',[SetChatGPTUser::class,'OnSetQuestion']); 

     /** <========= Authorization Route Ends here ===========>*/
    /**
     *  <=========== Display User Wise Chat-gpt data =============>
     */
    // user wise Chat-Gpt result starts here 
    // Display the result to the user. With Used Table Relationship user wise

    Route::get('/display-result',[SetChatGPTUser::class,'OnDisplayResult']); 
    // user wise Chat-Gpt result Ends here
    
});
     /**
     *  <===========For registration =============>
     */
     Route::post('/registration',[UserRegistration::class,'OnRegister']);
     /**
     *  <===========For registration Ends here=============>
     */
     /**
     *  <===========For Login Starts here=============>
     */
    Route::post('/Login',[UserRegistration::class,'OnLogInCheck']);
     /**
     *  <===========For Login Ends here=============>
     */

