<#include "security.ftlh">
<#import "pager.ftlh" as p>
    <@p.pager url page />
<div class="row row-cols-1 row-cols-md-3 g-4 my-3">

    <#list page.content as message>

        <div class="col">
            <div class="card my-3" style="width: 18rem;">
                <div>
                            <#if message.filename??>
                                <img class="card-img-top" src="/img/${message.filename}">
                            </#if>
                </div>
                <span>${message.text}</span><br/>
                <i>#${message.tag}</i>
                <div class="card-footer container">
                    <div class="row">
                        <a class = "col align-self-center" href="user-messages/${message.author.id}">${message.authorName}</a>
                        <a class = "col align-self-center" href="/messages/${message.id}/like">
                        <#if message.meLiked>
                            <i class="fa-solid fa-heart"></i>
                        <#else>
                            <i class="fa-regular fa-heart"></i>
                        </#if>
                        ${message.likes}
                        </a>
                        <#if message.author.id == currentUserId>
                        <a class=" col btn btn-primary" href="user-messages/${message.author.id}?message=${message.id}">Edit</a>
                        </#if>
                    </div>
                </div>
            </div>
        </div>

    <#else>
        No messages
    </#list>
</div>
