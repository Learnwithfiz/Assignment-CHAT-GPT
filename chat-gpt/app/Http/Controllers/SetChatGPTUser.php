<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;
class SetChatGPTUser extends Controller
{
    /**
     * Set User Secrate Api Key when User Login Dashboard and show their name and his own Api key starts here 
     * 
     */
    public function OnSetUserApiInfo(Request $req)
    {
        
        $email = $req->input('email');
        $ApiKey = $req->input('ApiKey');
        $inserted_date = date('d/m/y');
        $sqlInsert = DB::table('set_user_gpt_api')->insert([
            'email'=>$email,
            'status_active'=>1,
            'is_deleted'=>0,
            'inserted_date'=>$inserted_date,
            'API_KEY'=>$ApiKey
        ]);
        $msg = "";
        if($sqlInsert)
        {
            $msg = "successfully set";
        }else{
          $msg = "Set failed";
        }
        return response()->json(['status'=>$msg]);
    }
    /**
     * Implement CHAT GPT API Using CURL.
     * If you need to write it down, use it................................ 
     * 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
     * <==============================================================================================>
     */
    public function OnSetQuestion(Request $req)
    {
        $TokenKey = $req->input('TokenKey');
        $question = $req->input('question');
        $data["model"] = "gpt-3.5-turbo";
        $data["messages"][0]["role"] = "system";
        $data["messages"][0]["content"] = $question;
       
        $headers = [
        "Content-Type: application/json",
        "Authorization: Bearer $TokenKey",
        "OpenAI-Beta: assistants=v1"
        ];

        $ch = curl_init();
        $url = "https://api.openai.com/v1/chat/completions";
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        $output = curl_exec($ch);

        curl_close($ch);
        $response = json_decode($output, true);
         //dd($response);die;
         $answer=$error="";
       
        // Here Check User Secrate Key Is Authorized or Un-Authorized 
        isset($response["choices"][0]["message"]["content"]) ? $answer= $response["choices"][0]["message"]["content"] : $error = "Un-Autorized User For Chat Gpt Key";
        

        // <============ Save the result to the database, associating it with the authenticated user.====================================>
        $userId = Auth::id();
        $status_active =  1 ;//when insert status=1 for active
        $is_deleted =  0 ;//when need delete change status value status=0 and is_deleted =1  for delete  ...... we are not permanently delete 
        $InsertDate = date('d/m/y') ;  
        
        if($answer)
        {
            $newSqlInsert = DB::table('user_gpt_info')->insert([
                'user_id'=>$userId,
                'gpt_search_info'=>$answer,
                'status_active'=>$status_active,
                'is_deleted'=>$is_deleted ,
                'inserted_date'=>$InsertDate ,
                'question'=>$question
            ]);
        }else{
            $answer = $error ;
        }
        
        return response()->json(['status'=>$answer]);
    }
    //  Authentic User Wise Data save Ends here

    // <================= Display the result to the user. With Used Table Relationship user wise ==================================>
    public function OnDisplayResult()
    {
        $userId = Auth::id();
        $sqlSelect = DB::table('user_gpt_info as a')
        ->select('b.name', 'a.gpt_search_info', 'a.question', 'a.inserted_date')
        ->join('users as b', 'b.id', '=', 'a.user_id')
        ->where('a.user_id', $userId)
        ->get();
        
        return response(['results_set'=>$sqlSelect]);
    }
}
