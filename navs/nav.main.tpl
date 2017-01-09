{component 'nav' name='main' activeItem=$sMenuHeadItemSelect mods='main' items=[
    [ 'text' => $aLang.blog.blogs,     'url' => {router page='blogs'},  'name' => 'blogs' ],
    [ 'text' => $aLang.user.users,     'url' => {router page='people'}, 'name' => 'people' ],
    [ 'text' => $aLang.activity.title, 'url' => {router page='stream'}, 'name' => 'stream' ],
    [ 'text' => 'Правила ресурса', 'url' => {router page='rules'}, 'name' => 'rules' ],
    [ 'text' => 'Фонд поддержки', 'url' => {router page='donate'}, 'name' => 'donate' ]
]}
