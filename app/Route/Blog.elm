module Route.Blog exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import Content
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html exposing (Html)
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
    {}


type alias Data =
    { page : Content.Page
    , posts : List Content.BlogPost
    }


type alias ActionData =
    {}


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildNoState { view = view }


data : BackendTask FatalError Data
data =
    BackendTask.map2 Data
        Content.blogIndexPage
        Content.publishedPosts


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    seo app.data.title app.data.description


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app _ =
    { title = app.data.page.title
    , body =
        [ Html.section [ Attr.class "page-intro" ]
            (Content.renderMarkdown app.data.page.body)
        , Html.section [ Attr.class "post-list-section" ]
            [ Html.h2 [] [ Html.text "Posts" ]
            , Html.ul [ Attr.class "post-list" ] (List.map postListItem app.data.posts)
            ]
        ]
    }


postListItem : Content.BlogPost -> Html msg
postListItem post =
    Html.li [ Attr.class "post-list-item" ]
        [ Html.article [ Attr.class "post-card" ]
            [ Html.h3 [ Attr.class "post-card-title" ]
                [ Html.a [ Attr.href ("/blog/" ++ post.slug) ] [ Html.text post.title ] ]
            , metadataBlock post
            , Html.p [ Attr.class "post-card-description" ] [ Html.text post.description ]
            ]
        ]


metadataBlock : Content.BlogPost -> Html msg
metadataBlock post =
    let
        parts =
            List.filterMap identity
                [ post.published
                , post.author
                ]
    in
    Html.p [ Attr.class "post-meta" ] [ Html.text (String.join " | " parts) ]


seo : String -> String -> List Head.Tag
seo title description =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "genthaler.github.io"
        , image =
            { url = [ "favicon.ico" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "genthaler.github.io"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = description
        , locale = Nothing
        , title = title
        }
        |> Seo.website
