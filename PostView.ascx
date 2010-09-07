<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>

<div class="post" id="post<%=Index %>">
  <div class="sidebar">
    <div class="sidebar">
      <div class="wrapper-date">
        <div class="d-day"><%=Post.DateCreated.Day.ToString() %></div>
        <div class="d-mon"><%=Post.DateCreated.ToString("MMM") %></div>
        <div class="d-year"><%=Post.DateCreated.ToString("yyyy") %></div>
      </div>
      <p class="authorname">
      <a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + BlogEngine.Core.Utils.RemoveIllegalCharacters(Post.Author) %>.aspx"><%=Post.AuthorProfile != null ? Post.AuthorProfile.DisplayName : Post.Author %></a>
      </p>
      <br />
      <p><img src="<%=Post.AuthorProfile != null ? Post.AuthorProfile.PhotoURL : "" %>" alt="<%=Post.AuthorProfile != null ? Post.AuthorProfile.DisplayName : Post.Author %>'s Avatar" /></p>
      <p class="notes">
        <a rel="nofollow" href="<%=Post.RelativeLink %>#comment"><%=Post.ApprovedComments.Count %> Notes</a>
      </p>
    </div>
  </div>
  <div class="content text">
    <h1 class ="post-title"><a href="<%=Post.RelativeLink %>" class="taggedlink"><%=Server.HtmlEncode(Post.Title) %></a></h1>
    <div class="go"><asp:PlaceHolder ID="BodyContent" runat="server" /></div>
    <div class="description">
      <p class="tags">Tags: <%=TagLinks(" ") %></p>
      <p class="categories"><%=CategoryLinks(", ") %></p>
      <%=Rating %>
    </div>
  </div>
  <div class="footer" style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(255, 255, 255); padding-top: 20px; padding-right: 0px; padding-bottom: 20px; padding-left: 0px; font-size: 10px; text-align: left; margin-bottom: 2.5em; background-position: initial initial; background-repeat: initial initial; ">    
    <a rel="nofollow" href="<%=Post.RelativeLink %>#comment"><%=Post.ApprovedComments.Count %> <%=Resources.labels.comments %> </a>
    <%=AdminLinks %>

    <% if (BlogEngine.Core.BlogSettings.Instance.ModerationType == BlogEngine.Core.BlogSettings.Moderation.Disqus)
       { %>
    <a rel="nofollow" href="<%=Post.PermaLink %>#disqus_thread"><%=Resources.labels.comments %></a>
    <%}
       else
       { %>
    <a rel="bookmark" href="<%=Post.PermaLink %>" title="<%=Server.HtmlEncode(Post.Title) %>">Permalink</a> |
    <%} %>
    </div>
</div>