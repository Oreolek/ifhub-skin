{**
 * Список топиков
 *
 * @param array $topics
 * @param array $paging
 *}

{component_define_params params=[ 'topics', 'paging' ]}

{if $topics}
    {add_block group='toolbar' name='component@toolbar-scrollnav.toolbar.scrollnav' show=count( $topics )}

    <div class="ifhub-content">
    {foreach $topics as $topic}
        {component 'topic' template='type' topic=$topic isList=true}
    {/foreach}
    </div>

    {component 'pagination' total=+$paging.iCountPage current=+$paging.iCurrentPage url="{$paging.sBaseUrl}/page__page__/{$paging.sGetParams}" classes='js-pagination-topics'}
{else}
    {component 'blankslate' text=$aLang.common.empty}
{/if}
