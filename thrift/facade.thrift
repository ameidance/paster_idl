namespace go ameidance.paster.facade

enum LanguageType {
    PLAIN = 0
    CPP = 1
    JAVA = 2
    PYTHON = 3
    GO = 4
    MD = 5
}

struct GetPostRequest {
    1: required i64 id
    2: optional string passwd
}

struct GetPostResponse {
    1: required string content
    2: required LanguageType lang
    3: required string nickname
    4: required bool is_disposable
    5: required i64 time
    254: required i32 status_code
    255: required string status_msg
}

struct SavePostRequest {
    1: required string content
    2: required LanguageType lang
    3: required string nickname
    4: required bool is_disposable
    5: optional string passwd
}

struct SavePostResponse {
    1: optional i64 id
    254: required i32 status_code
    255: required string status_msg
}

struct CommentInfo {
    1: required string content
    2: required string nickname
    3: optional i64 time
}

struct GetCommentsRequest {
    1: required i64 post_id
    2: optional string passwd
}

struct GetCommentsResponse {
    1: optional list<CommentInfo> info
    254: required i32 status_code
    255: required string status_msg
}

struct SaveCommentRequest {
    1: required string content
    2: required string nickname
    3: required i64 post_id
    4: optional string passwd
}

struct SaveCommentResponse {
    254: required i32 status_code
    255: required string status_msg
}

service PasterFacadeService {
    GetPostResponse GetPost(1: GetPostRequest req) (api.post = '/post/get/')
    SavePostResponse SavePost(1: SavePostRequest req) (api.post = '/post/save/')
    GetCommentsResponse GetComments(1: GetCommentsRequest req) (api.get = '/comment/get/')
    SaveCommentResponse SaveComment(1: SaveCommentRequest req) (api.post = '/comment/save/')
}
