<?php

use App\Http\Controllers\Api\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


Route::get('/ping', function () {
    return response()->json(['message' => 'pong']);
});

// sin in , login 
Route::post('/register', [AuthController::class, 'register']); // registing to the app
Route::post('/login', [AuthController::class, 'login']); // login to the app
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']); // logout from the app
    Route::patch('/addEmail', [AuthController::class, 'addEmail']); //  add email to the app
});
// still working on it  (Owais)
Route::post('/forgot-password', [AuthController::class, 'forgotPassword']);
Route::post('/reset-password', [AuthController::class, 'resetPassword']);
