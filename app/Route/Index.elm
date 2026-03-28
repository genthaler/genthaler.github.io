module Route.Index exposing (ActionData, Data, Model, Msg, route)

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
    {}


type alias Data =
    { page : Content.Page
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
    BackendTask.map Data Content.rootPage


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "genthaler.github.io"
        , image =
            { url = [ "favicon.ico" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "genthaler.github.io"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = app.data.page.description
        , locale = Nothing
        , title = app.data.page.title
        }
        |> Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app _ =
    { title = app.data.page.title
    , body =
        [ Html.section [ Attr.class "page-intro" ]
            (Content.renderMarkdown app.data.page.body)
        , Html.p [ Attr.class "primary-action" ]
            [ Html.a [ Attr.class "button-link", Attr.href "/blog" ]
                [ Html.text "Read the blog" ]
            ]
        ]
    }
