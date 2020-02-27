{**
 * Последняя активность
 *}

{component_define_params params=[ 'content' ]}

{* Подвал *}
{capture 'block_footer'}
    <a href="{router page='rss'}/index">RSS главной страницы</a><br>
    <a href="{router page='rss'}new/">RSS всех топиков</a><br>
    <a href="{router page='rss'}allcomments/">RSS комментариев</a>
{/capture}

{component 'block'
    mods     = 'primary activity-recent'
    classes  = 'js-block-default'
    title    = {lang 'activity.block_recent.title'}
    titleUrl = {router 'stream'}
    footer   = $smarty.capture.block_footer
    tabs     = [
        'classes' => 'js-tabs-block js-activity-block-recent-tabs',
        'tabs' => [
            [ 'text' => 'Новые топики',   'url' => "{router page='ajax'}stream/topic", 'list' => $content ],
            [ 'text' => 'Свежие комментарии', 'url' => "{router page='ajax'}stream/comment" ]
        ]
    ]}
