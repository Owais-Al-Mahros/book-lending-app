<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use App\Services\AuthService;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Mail\ResetCodeMail;
use Illuminate\Support\Facades\Mail;

class AuthController extends Controller
{
    public function __construct(private AuthService $authService) {}

    public function register(Request $request)
    {
        $data = $request->validate(
            [
                'name'     => 'required|string|max:255',
                'email'    => 'nullable|email|unique:users',
                'phone'    => 'required|string|min:10|unique:users',
                'password' => 'required|string|min:8',
            ],
            [
                'phone.unique' => "This phone number already has an account, please log in",
                'email.unique' => "This email already has an account, please log in",
            ]
        );


        return response()->json(
            $this->authService->register($data),
            201
        );
    }



    public function login(Request $request)
    {
        $data = $request->validate([
            'phone' => "required|string|min:10",
            'password' => 'required|string',
        ]);

        $result = $this->authService->login($data);
        if ($result['success']) {
            return response()->json($result, 200);
        }

        return response()->json($result, 401);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json([
            'success' => true,
            'message' => "you logout your account",
            'data' => [],
        ], 200);
    }

    public function addEmail(Request $request)
    {
        $data = $request->validate([
            'email' => 'required|email|unique:users'
        ]);
        $user = $request->user();
        $user->update(['email' => $data['email']]);

        return response()->json([
            'success' => true,
            'message' => 'Email added successfully',
            'data' => ['user' => $user],
        ]);
    }

    public function forgotPassword(Request $request)
    {
        $data = $request->validate(
            ['email' => 'required|email|exists:users,email'],
            ['email.exists' => 'sorry, please check your email']
        );

        $code = random_int(100000, 999999);

        DB::table('password_reset_tokens')->updateOrInsert(
            ['email' => $data['email']],              // ابحث بهذا
            ['token' => Hash::make($code), 'created_at' => now()]  // وحدّث/أنشئ بهذه
        );
        $address = $data['email'];
        Mail::to($address)->send(new ResetCodeMail((string) $code));

        return response()->json([
            'success' => true,
            'message' => 'the code has sended to your email',
            'data' => [],
        ]);
    }
}
