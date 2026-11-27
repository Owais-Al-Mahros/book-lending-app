<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use App\Mail\ResetCodeMail;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Carbon;

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
        $column =  str_contains($data['login'], '@') ? "email" : "phone";
        $user = User::where($column, $data['login'])->first();

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
                'message' => "please check your phone number or password",
                'data' => [],
            ];
        }
    }

    public function sendResetCode(string $email): void
    {
        $code = random_int(100000, 999999);

        DB::table('password_reset_tokens')->updateOrInsert(
            ['email' => $email],              // ابحث بهذا
            ['token' => Hash::make($code), 'created_at' => now()]  // وحدّث/أنشئ بهذه
        );

        Mail::to($email)->send(new ResetCodeMail((string) $code));
    }


    public function resetPassword(array $data): array
    {
        $record = DB::table('password_reset_tokens')->where('email', $data['email'])->first();

        if (
            $record
            && !Carbon::parse($record->created_at)->addMinutes(10)->isPast()
            && Hash::check($data['code'], $record->token)
        ) {
            $user = User::where('email', $data['email'])->first();
            $user->update(['password' => $data['password']]); // instaed of saving
            DB::table('password_reset_tokens')->where('email', $data['email'])->delete();
            return [
                'success' => true,
                'message' => 'Password reset successfully',
                'data' => [],
            ];
        }

        return [
            'success' => false,
            'message' => 'Invalid or expired code',
            'data' => [],
        ];
    }
}
