{**
 * Новый пароль
 *}

{extends 'email'}

{block 'content'}
    {lang name='emails.reminder_password.text' params=[
        'password' => $sNewPassword
    ]}
{/block}