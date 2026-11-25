<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Reset Code</title>
</head>

<body style="font-family: Arial, Tahoma, sans-serif; background-color: #f4f4f7; margin: 0; padding: 20px; text-align: left; color: #333333;">

    <div style="max-width: 500px; margin: 0 auto; background-color: #ffffff; padding: 30px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
        <h2 style="margin-top: 0; color: #222222;">Reset Your Password</h2>

        <p style="font-size: 16px; line-height: 1.5;">
            Hello,<br>
            Use the following code to reset your password:
        </p>

        <div style="margin: 25px 0; padding: 15px; background-color: #f0f4f8; border-radius: 6px; text-align: center;">
            <span style="font-size: 28px; font-weight: bold; letter-spacing: 5px; color: #1a73e8; display: inline-block;">
                {{ $code }}
            </span>
        </div>

        <p style="font-size: 14px; color: #555555;">
            <strong>Note:</strong> this code is valid for <strong>10 minutes</strong> only.
        </p>

        <hr style="border: none; border-top: 1px solid #eeeeee; margin: 20px 0;">

        <p style="font-size: 12px; color: #888888; margin-bottom: 0;">
            If you did not request a password reset, you can safely ignore this email.
        </p>
    </div>

</body>

</html>