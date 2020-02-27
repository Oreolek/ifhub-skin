{component_define_params params=[ 'user', 'topic', 'date', 'commentN' ]}

{capture 'item_content'}
    <time class="hidden" datetime="{date_format date=$date format='c'}" class="ls-activity-block-recent-time">
        {date_format date=$date hours_back="12" minutes_back="60" now="60" day="day H:i" format="j.m.Y"}
    </time>

    <div class="shortinfo">
        <a href="{$user->getUserWebPath()}" class="ls-activity-block-recent-user">{$user->getDisplayName()}</a>
        <br>
        <a href="{$topic->getUrl()}#comment{$commentN}">{$topic->getTitle()|escape}</a>
    </div>

    <div class="ls-activity-block-recent-info">
        <a href="{$topic->getUrl()}#comments" class="ls-activity-block-recent-comments">
            {component 'icon' icon='comments'}
            {$topic->getCountComment()}
            <span class="sr-only">
                {lang 'comments.comments_short' count=$topic->getCountComment() plural=true}
            </span>
        </a>
    </div>
{/capture}

{component 'item'
    element = 'li'
    desc = $smarty.capture.item_content
}
