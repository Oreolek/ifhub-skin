{**
 * Смена пароля
 *}

{extends 'email'}

{block 'content'}
    {lang name='emails.reminder_code.text' params=[
        'website_url'  => Router::GetPath('/'),
        'website_name' => Config::Get('view.name'),
        'recover_url'  => "{router page='auth'}password-reset/{$oReminder->getCode()}/"
    ]}
{/block}