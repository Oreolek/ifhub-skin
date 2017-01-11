{**
 * Последняя активность
 * Топики отсортированные по времени последнего комментария
 *}

{component_define_params params=[ 'comments' ]}

{capture 'items'}
    {foreach $comments as $comment}
        {$topic = $comment->getTarget()}

        {component 'activity' template='blocks/recent-comment'
            user     = $comment->getUser()
            topic    = $topic
            commentN = $comment->getID()
            date     = $comment->getDate()}
    {foreachelse}
        {component 'blankslate' text={lang 'common.empty'} mods='no-background'}
    {/foreach}
{/capture}

{component 'item' template='group' items=$smarty.capture.items}
