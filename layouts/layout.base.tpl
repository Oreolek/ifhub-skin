{**
 * Основной лэйаут, который наследуют все остальные лэйауты
 *
 * @param boolean $layoutShowSidebar        Показывать сайдбар или нет, сайдбар не будет выводится если он не содержит блоков
 * @param string  $layoutNavContent         Название навигации
 * @param string  $layoutNavContentPath     Кастомный путь до навигации контента
 * @param string  $layoutShowSystemMessages Показывать системные уведомления или нет
 *}

{extends 'component@layout.layout'}

{block 'layout_options' append}
    {$layoutShowSidebar = $layoutShowSidebar|default:true}
    {$layoutShowSystemMessages = $layoutShowSystemMessages|default:true}
{/block}

{block 'layout_head_styles' append}
    <link rel="apple-touch-icon" href="{cfg 'path.skin.assets.web'}/images/touchicon.png">
    <link rel="apple-touch-icon" sizes="120x120" href="{cfg 'path.skin.assets.web'}/images/touchicon_120.png">
    <link rel="apple-touch-icon" sizes="152x152" href="{cfg 'path.skin.assets.web'}/images/touchicon_152.png">
    <link rel="search" type="application/opensearchdescription+xml" href="{router page='search'}opensearch/" title="{Config::Get('view.name')}" />
    <link rel="preconnect" href="https://mc.yandex.ru" />
    <link rel="preconnect" href="https://cdn.jsdelivr.net" />
{/block}

{block 'layout_head' append}
    {* Получаем блоки для вывода в сайдбаре *}
    {if $layoutShowSidebar}
        {show_blocks group='right' assign=layoutSidebarBlocks}

        {$layoutSidebarBlocks = trim( $layoutSidebarBlocks )}
        {$layoutShowSidebar = !!$layoutSidebarBlocks}
    {/if}

    {**
     * Тип сетки сайта
     *}
    {if {Config::Get('view.grid.type')} == 'fluid'}
        <style>
            .layout-userbar,
            .layout-nav .ls-nav--main,
            .layout-header .ls-jumbotron-inner,
            .layout-container,
            .container {
                min-width: {Config::Get('view.grid.fluid_min_width')};
                max-width: {Config::Get('view.grid.fluid_max_width')};
            }
        </style>
    {else}
        <style>
            .layout-userbar,
            .layout-nav .ls-nav--main,
            .layout-header .ls-jumbotron-inner,
            .layout-container,
            .container { width: {Config::Get('view.grid.fixed_width')}; }
        </style>
    {/if}
{/block}

{block 'layout_body'}
    {hook run='layout_body_begin'}
    {**
     * Основная навигация
     *}
    <div class="layout-container">
    <nav class="ls-grid-row layout-nav">
        <div class="ls-userbar-logo">
            <a href="{router page='/'}"><img src="/application/frontend/skin/ifhub/assets/images/logo.png" height="60px"></a>
        </div>

        <nav class="ls-userbar-nav">
            {if $oUserCurrent}
                {$createMenu = []}

                {foreach $LS->Topic_GetTopicTypes() as $type}
                    {$createMenu[] = [ 'name' => $type->getCode(), 'text' => $type->getName(), 'url' => $type->getUrlForAdd() ]}
                {/foreach}

                {$createMenu[] = [ 'name' => 'talk', 'text' => {lang 'modal_create.items.talk'}, 'url' => {router page='talk'} ]}
                {$createMenu[] = [ 'name' => 'drafts', 'text' => {lang 'topic.drafts'}, 'url' => "{router page='content'}drafts/", count => $iUserCurrentCountTopicDraft ]}

                {$items = [
                    [
                        'text'       => "<img src=\"{$oUserCurrent->getProfileAvatarPath(24)}\" alt=\"{$oUserCurrent->getDisplayName()}\" class=\"avatar\" /> {$oUserCurrent->getDisplayName()}",
                        'url'        => "{$oUserCurrent->getUserWebPath()}",
                        'classes'    => 'ls-nav-item--userbar-username',
                        'menu'       => [
                            'items' => [
                                [ 'name' => 'whois',      'text' => {lang name='user.profile.nav.info'},         'url' => "{$oUserCurrent->getUserWebPath()}" ],
                                [ 'name' => 'wall',       'text' => {lang name='user.profile.nav.wall'},         'url' => "{$oUserCurrent->getUserWebPath()}wall/", 'count' => $iUserCurrentCountWall ],
                                [ 'name' => 'created',    'text' => {lang name='user.profile.nav.publications'}, 'url' => "{$oUserCurrent->getUserWebPath()}created/topics/", 'count' => $iUserCurrentCountCreated ],
                                [ 'name' => 'favourites', 'text' => {lang name='user.profile.nav.favourite'},    'url' => "{$oUserCurrent->getUserWebPath()}favourites/topics/", 'count' => $iUserCurrentCountFavourite ],
                                [ 'name' => 'friends',    'text' => {lang name='user.profile.nav.friends'},      'url' => "{$oUserCurrent->getUserWebPath()}friends/", 'count' => $iUserCurrentCountFriends ],
                                [ 'name' => 'activity',   'text' => {lang name='user.profile.nav.activity'},     'url' => "{$oUserCurrent->getUserWebPath()}stream/" ],
                                [ 'name' => 'talk',       'text' => {lang name='user.profile.nav.messages'},     'url' => "{router page='talk'}", 'count' => $iUserCurrentCountTalkNew ],
                                [ 'name' => 'settings',   'text' => {lang name='user.profile.nav.settings'},     'url' => "{router page='settings'}" ],
                                [ 'name' => 'admin',      'text' => {lang name='admin.title'},                   'url' => "{router page='admin'}", 'is_enabled' => $oUserCurrent && $oUserCurrent->isAdministrator() ]
                            ]
                        ]
                    ],
                    [ 'text' => $aLang.common.create, menu => [ hook => 'create', items => $createMenu ] ],
                    [ 'text' => $aLang.talk.title,   'url' => "{router page='talk'}", 'title' => $aLang.talk.new_messages, 'is_enabled' => $iUserCurrentCountTalkNew, 'count' => $iUserCurrentCountTalkNew ],
                    [ 'text' => $aLang.auth.logout,  'url' => "{router page='auth'}logout/?security_ls_key={$LIVESTREET_SECURITY_KEY}" ]
                ]}
            {else}
                {$items = [
                    [ 'text' => $aLang.auth.login.title,        'classes' => 'js-modal-toggle-login',        'url' => {router page='auth/login'} ],
                    [ 'text' => $aLang.auth.registration.title, 'classes' => 'js-modal-toggle-registration', 'url' => {router page='auth/register'} ]
                ]}
            {/if}

            {component 'nav' hook='userbar_nav' hookParams=[ user => $oUserCurrent ] activeItem=$sMenuHeadItemSelect mods='userbar' items=$items}
        </nav>

        {include 'navs/nav.main.tpl'}

        {component 'search' template='main' mods='light'}
    </nav></div>
    {if $oUserCurrent}
        {component 'modal-create'}
    {/if}

    {**
     * Основной контэйнер
     *}
    <div id="container" class="ls-grid-row layout-container {hook run='layout_container_class' action=$sAction} {if $layoutShowSidebar}layout-has-sidebar{else}layout-no-sidebar{/if}">
        {* Вспомогательный контейнер-обертка *}
        <div class="ls-grid-row layout-wrapper {hook run='layout_wrapper_class' action=$sAction}">
            {**
             * Контент
             *}
            <div class="ls-grid-col ls-grid-col-8 layout-content"
                 role="main"
                 {if $sMenuItemSelect == 'profile'}itemscope itemtype="http://data-vocabulary.org/Person"{/if}>

                {hook run='layout_content_header_begin' action=$sAction}

                {* Основной заголовок страницы *}
                {block 'layout_page_title' hide}
                    <h2 class="page-header">
                        {$smarty.block.child}
                    </h2>
                {/block}

                {block 'layout_content_header'}
                    {* Навигация *}
                    {if $layoutNav}
                        {$_layoutNavContent = ""}

                        {if is_array($layoutNav)}
                            {foreach $layoutNav as $layoutNavItem}
                                {if is_array($layoutNavItem)}
                                    {component 'nav' mods='pills' params=$layoutNavItem assign=_layoutNavItemContent}
                                    {$_layoutNavContent = "$_layoutNavContent $_layoutNavItemContent"}
                                {else}
                                    {$_layoutNavContent = "$_layoutNavContent $layoutNavItem"}
                                {/if}
                            {/foreach}
                        {else}
                            {$_layoutNavContent = $layoutNav}
                        {/if}

                        {* Проверяем наличие вывода на случай если меню с одним пунктом автоматом скрывается *}
                        {if $_layoutNavContent|strip:''}
                            <div class="ls-nav-group">
                                {$_layoutNavContent}
                            </div>
                        {/if}
                    {/if}

                    {* Системные сообщения *}
                    {if $layoutShowSystemMessages}
                        {if $aMsgError}
                            {component 'alert' text=$aMsgError mods='error' close=true}
                        {/if}

                        {if $aMsgNotice}
                            {component 'alert' text=$aMsgNotice close=true}
                        {/if}
                    {/if}
                {/block}

                {hook run='layout_content_begin' action=$sAction}
                {block 'layout_content'}{/block}

                {hook run='layout_content_end' action=$sAction}
                {show_blocks group='similar'}
            </div>

            {**
             * Сайдбар
             * Показываем сайдбар
             *}
            {if $layoutShowSidebar}
                <aside class="ls-grid-col ls-grid-col-4 layout-sidebar" role="complementary">
                    {$layoutSidebarBlocks}

                    <div class="ls-block">
                        <header class="ls-block-header">
                            <h3 class="ls-block-title">Мы в социальных сетях</h3>
                        </header>
                        <ul class="ls-item-group">
                            <li class="ls-item">
                                <p><i class="fa fa-twitter"></i> <a href="https://twitter.com/if_hub">Twitter: @if_hub</a></p>
                            </li>
                            <li class="ls-item">
                                <p><i class="fa fa-vk"></i> <a href="https://vk.com/ifhub">ВКонтакте: ifhub</a></p>
                            </li>
                            <li class="ls-item">
                                <p><i class="fa fa-telegram"></i> <a href="https://t.me/ifhub">Telegram: @IFHub</a></p>
                            </li>
                            <li class="ls-item">
                                <p><i class="fa fa-pencil"></i> <a rel="me" href="https://botsin.space/@ifhub">Mastodon: @IFHub@botsin.space</a></p>
                            </li>
                        </ul>
                    </div>
                </aside>
            {/if}
        </div> {* /wrapper *}


        {* Подвал *}
        <footer class="ls-grid-row layout-footer">
            {block 'layout_footer'}
                {hook run='layout_footer_begin'}
                {hook run='copyright'}
                {hook run='layout_footer_end'}
            {/block}
        </footer>
    </div> {* /container *}


    {* Подключение модальных окон *}
    {if $oUserCurrent}
        {component 'tags-personal' template='modal'}
    {else}
        {component 'auth' template='modal'}
    {/if}


    {**
     * Тулбар
     * Добавление кнопок в тулбар
     *}
    {add_block group='toolbar' name='component@admin.toolbar.admin' priority=100}
    {add_block group='toolbar' name='component@toolbar-scrollup.toolbar.scrollup' priority=-100}

    {* Подключение тулбара *}
    {component 'toolbar' classes='js-toolbar-default' items={show_blocks group='toolbar'}}

<!-- Yandex.Metrika counter -->
<noscript><div><img src="https://mc.yandex.ru/watch/42008629" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<script type="text/javascript" >
(function (d, w, c) {
 (w[c] = w[c] || []).push(function() {
  try {
   w.yaCounter42008629 = new Ya.Metrika2({
    id:42008629,
    clickmap:true,
    trackLinks:true,
    accurateTrackBounce:true
   });
  } catch(e) { }
 });

 var n = d.getElementsByTagName("script")[0],
 s = d.createElement("script"),
 f = function () { n.parentNode.insertBefore(s, n); };
 s.type = "text/javascript";
 s.async = true;
 s.src = "https://cdn.jsdelivr.net/npm/yandex-metrica-watch/tag.js";

 if (w.opera == "[object Opera]") {
     d.addEventListener("DOMContentLoaded", f, false);
 } else { f(); }
})(document, window, "yandex_metrika_callbacks2");
// /Yandex.Metrika counter
</script>
{hook run='layout_body_end'}
{/block}
