using Markdown

function hfun_bar(vname)
  val = Meta.parse(vname[1])
  return round(sqrt(val), digits=2)
end

function hfun_m1fill(vname)
  var = vname[1]
  return pagevar("index", var)
end

function lx_baz(com, _)
  # keep this first line
  brace_content = Franklin.content(com.braces[1]) # input string
  # do whatever you want here
  return uppercase(brace_content)
end

function hfun_listposts()
    posts = readdir("./blog/posts/") |> reverse .|> splitext .|> x->first(x)
    return join(map(filter(i -> i!="index", posts)) do filename
        "- $(filename) - [$(pagevar("./blog/posts/$(filename)", "post_title"))](/blog/posts/$(filename))"
    end, "\n") |> Markdown.parse |> html
end
