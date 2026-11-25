<?php

namespace App\Services;

use App\Models\User;
use GrahamCampbell\ResultType\Success;
use Illuminate\Support\Facades\Hash;

class AuthService
{
    /**
     * Create a new class instance.
     */
    public function __construct()
    {
        //
    }

    public function register(array $data)
    {
        $user = User::create($data);
        $token = $user->createToken('mobile')->plainTextToken;

        return [
            'success' => true,
            'message' => "Welcome to book lending app {$user->name}",
            'data' => [
                'user' => $user,
                'token' => $token,
            ],
        ];
    }

    public function login(array $data)
    {
        $user = User::where('phone', $data['phone'])->first();

        if (!$user) {
            return [
                'success' => false,
                'message' => "please create an account first then you can log in",
                'data' => [],

            ];
        }
        $plainPassword = $data['password'];
        $canPass = Hash::check($plainPassword, $user->password);

        if ($canPass) {
            $name = $user['name'];
            $token = $user->createToken('mobile')->plainTextToken;
            return [
                'success' => true,
                'message' => "welcome back $name",
                'data' => [
                    'user' => $user,
                    'token' => $token
                ],
            ];
        } else {
            return [
                'success' => false,
                'message' => "please cheack your phone number or password",
                'data' => [],
            ];
        }
    }
}
