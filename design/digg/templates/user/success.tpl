<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">

<div class="user-success">

{if $verify_user_email}
<div class="attribute-header">
    <h1 class="long">{"User registered"|i18n("design/ezwebin/user/success")}</h1>
</div>

<div class="feedback">
<p>
{'Your account was successfully created. An email will be sent to the specified address. Follow the instructions in that email to activate your account.'|i18n('design/ezwebin/user/success')}
</p>
</div>
{else}
<div class="attribute-header">
    <h1 class="long">{"User registered"|i18n("design/ezwebin/user/success")}</h1>
</div>

<div class="feedback">
    <p>Your account was created and you are logged in so <a href="/all/(dir)/1">you can now upcomming stories</a> and <a href="/c#select-a-category-first">submit your first story on digg</a>!</p>
</div>
{/if}

</div>

</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>