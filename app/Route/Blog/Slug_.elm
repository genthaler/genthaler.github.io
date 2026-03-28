module Route.Blog.Slug_ exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import Content
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html
import Html.Attributes as Attr
import Pages.Url
import PagesMsg exposing (PagesMsg)
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import UrlPath
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    { slug : String }


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.preRender
        { head = head
        , pages = pages
        , data = data
        }
        |> RouteBuilder.buildNoState { view = view }


pages : BackendTask FatalError (List RouteParams)
pages =
    Content.publishedRouteParams


type alias Data =
    { post : Content.BlogPost
    }


type alias ActionData =
    {}


data : RouteParams -> BackendTask FatalError Data
data routeParams =
    BackendTask.map Data (Content.postBySlug routeParams.slug)


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "genthaler.github.io"
        , image =
            { url = [ "favicon.ico" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = app.data.post.title
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = app.data.post.description
        , locale = Nothing
        , title = app.data.post.title
        }
        |> Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app _ =
    { title = app.data.post.title
    , body =
        [ Html.article [ Attr.class "post-page" ]
            [ Html.p [ Attr.class "eyebrow" ]
                [ Html.a [ Attr.href "/blog" ] [ Html.text "Blog" ] ]
            , Html.h1 [ Attr.class "post-title" ] [ Html.text app.data.post.title ]
            , Html.p [ Attr.class "post-meta" ]
                [ Html.text <|
                    String.join " | "
                        (List.filterMap identity
                            [ app.data.post.published
                            , app.data.post.author
                            ]
                        )
                ]
            , Html.div [ Attr.class "markdown-body" ] (Content.renderMarkdown app.data.post.body)
            ]
        ]
    }
