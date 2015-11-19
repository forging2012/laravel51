@extends('home')

@section('content')
    <div class="col-sm-8 blog-main">

        @foreach($articles as $article)
            <div class="blog-post">
                <h2 class="blog-post-title"><a href="{{url('article/'.$article->id)}}" title="{{$article->title}}">{{$article->title}}</a></h2>
                <p class="blog-post-meta">Posted in <a href="{{url('category/'.$article->category['id'])}}">{{$article->category['name']}}</a> Date: {{date('Y-m-d',strtotime($article->updated_at))}} Tags:
                    @foreach($article->tags as $tag)
                        <a href="{{url('tag/'.$tag->id)}}">{{$tag->name}}</a>
                    @endforeach
                    By: <a href="#">{{ $article->user['name']}}</a></p>
            </div><!-- /.blog-post -->
        @endforeach

        <nav>
            {!! $articles->render() !!}
        </nav>
    </div><!-- /.blog-main -->
@endsection