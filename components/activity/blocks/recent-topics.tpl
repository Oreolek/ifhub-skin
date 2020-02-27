{**
 * Последняя активность
 * Последние топики
 *}

{component_define_params params=[ 'topics' ]}

{capture 'items'}
    {foreach $topics as $topic}
        {component 'activity' template='blocks/recent-topic'
            user     = $topic->getUser()
            topic    = $topic
            date     = $topic->getDatePublish()}
    {foreachelse}
        {component 'blankslate' text={lang 'common.empty'} mods='no-background'}
    {/foreach}
{/capture}

{component 'item' template='group' items=$smarty.capture.items}
