{**
 * Форма основного поиска (по топикам и комментариям)
 *}

{component_define_params params=[ 'searchType', 'mods', 'classes', 'attributes' ]}

<div class="main-search">
{component 'search-form' name='main' action="{router page='search'}{$searchType|default:'topics'}" params=$params}
</div>
