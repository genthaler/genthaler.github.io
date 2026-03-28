module Content exposing
    ( BlogPost
    , Page
    , blogIndexPage
    , postBySlug
    , publishedPosts
    , publishedRouteParams
    , renderMarkdown
    , rootPage
    )

import BackendTask exposing (BackendTask)
import BackendTask.File as File
import BackendTask.Glob as Glob
import FatalError exposing (FatalError)
import Html exposing (Html)
import Html.Attributes as Attr
import Json.Decode as Decode exposing (Decoder)
import Markdown.Parser
import Markdown.Renderer


type alias BaseContent =
    { title : String
    , description : String
    , author : Maybe String
    , published : Maybe String
    , draft : Bool
    , image : Maybe String
    , tags : List String
    , body : String
    }


type alias Page =
    BaseContent


type alias BlogPost =
    { slug : String
    , title : String
    , description : String
    , author : Maybe String
    , published : Maybe String
    , draft : Bool
    , image : Maybe String
    , tags : List String
    , body : String
    }


type alias RouteParams =
    { slug : String }


rootPage : BackendTask FatalError Page
rootPage =
    pageFromFile "content/index.md"


blogIndexPage : BackendTask FatalError Page
blogIndexPage =
    pageFromFile "content/blog/index.md"


publishedRouteParams : BackendTask FatalError (List RouteParams)
publishedRouteParams =
    publishedPosts
        |> BackendTask.map (List.map (\post -> { slug = post.slug }))


publishedPosts : BackendTask FatalError (List BlogPost)
publishedPosts =
    allPosts
        |> BackendTask.map
            (List.filter (\post -> not post.draft) >> List.sortWith comparePosts)


postBySlug : String -> BackendTask FatalError BlogPost
postBySlug slug =
    publishedPosts
        |> BackendTask.andThen
            (\posts ->
                case List.filter (\post -> post.slug == slug) posts |> List.head of
                    Just post ->
                        BackendTask.succeed post

                    Nothing ->
                        BackendTask.fail (FatalError.fromString ("No published blog post found for slug `" ++ slug ++ "`."))
            )


renderMarkdown : String -> List (Html msg)
renderMarkdown markdown =
    case
        markdown
            |> Markdown.Parser.parse
            |> Result.mapError (\_ -> "Unable to parse markdown.")
            |> Result.andThen (Markdown.Renderer.render Markdown.Renderer.defaultHtmlRenderer)
    of
        Ok rendered ->
            rendered

        Err _ ->
            [ Html.pre [ Attr.class "markdown-fallback" ] [ Html.text markdown ] ]


pageFromFile : String -> BackendTask FatalError Page
pageFromFile filePath =
    File.bodyWithFrontmatter pageDecoder filePath
        |> BackendTask.allowFatal


pageDecoder : String -> Decoder Page
pageDecoder body =
    Decode.map7
        (\title description author published draft image tags ->
            { title = title
            , description = description
            , author = author
            , published = published
            , draft = draft
            , image = image
            , tags = tags
            , body = body
            }
        )
        (stringField "title" "")
        (stringField "description" "")
        (maybeStringField "author")
        (maybeStringField "published")
        (boolField "draft" False)
        (maybeStringField "image")
        tagsDecoder


allPosts : BackendTask FatalError (List BlogPost)
allPosts =
    postFiles
        |> BackendTask.andThen
            (\files ->
                files
                    |> List.map loadPost
                    |> BackendTask.combine
            )


type alias PostFile =
    { filePath : String
    , slug : String
    }


postFiles : BackendTask FatalError (List PostFile)
postFiles =
    Glob.succeed PostFile
        |> Glob.captureFilePath
        |> Glob.match (Glob.literal "content/blog/")
        |> Glob.capture Glob.wildcard
        |> Glob.match (Glob.literal ".md")
        |> Glob.toBackendTask
        |> BackendTask.map (List.filter (\file -> file.slug /= "index"))


loadPost : PostFile -> BackendTask FatalError BlogPost
loadPost postFile =
    File.bodyWithFrontmatter (postDecoder postFile.slug) postFile.filePath
        |> BackendTask.allowFatal


postDecoder : String -> String -> Decoder BlogPost
postDecoder slug body =
    Decode.map7
        (\title description author published draft image tags ->
            { slug = slug
            , title = title
            , description = description
            , author = author
            , published = published
            , draft = draft
            , image = image
            , tags = tags
            , body = body
            }
        )
        (stringField "title" slug)
        (stringField "description" "")
        (maybeStringField "author")
        (maybeStringField "published")
        (boolField "draft" False)
        (maybeStringField "image")
        tagsDecoder


comparePosts : BlogPost -> BlogPost -> Order
comparePosts left right =
    case compare right.published left.published of
        EQ ->
            compare left.slug right.slug

        other ->
            other


stringField : String -> String -> Decoder String
stringField fieldName fallback =
    Decode.oneOf
        [ Decode.field fieldName Decode.string
        , Decode.succeed fallback
        ]


maybeStringField : String -> Decoder (Maybe String)
maybeStringField fieldName =
    Decode.oneOf
        [ Decode.field fieldName Decode.string |> Decode.map Just
        , Decode.succeed Nothing
        ]


boolField : String -> Bool -> Decoder Bool
boolField fieldName fallback =
    Decode.oneOf
        [ Decode.field fieldName Decode.bool
        , Decode.succeed fallback
        ]


tagsDecoder : Decoder (List String)
tagsDecoder =
    Decode.oneOf
        [ Decode.field "tags" (Decode.list Decode.string)
        , Decode.field "tags" Decode.string |> Decode.map List.singleton
        , Decode.succeed []
        ]
