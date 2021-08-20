using Markdown 

function hfun_listposts()
                  posts = readdir("/blog/posts") |> reverse .|> splitext .|> x->first(x)
                  return join(map(filter(i -> i!="index", posts)) do filename
                      "- $(filename) - [$(pagevar("posts/$(filename)", "post_title"))]($(filename))"
                  end, "\n") |> Markdown.parse |> html
              end

hfun_listposts()
