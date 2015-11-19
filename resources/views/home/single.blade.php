@section('title', $article->title.' - ')
@extends('home')

@section('content')
    <div class="col-sm-8 blog-main">
        <div class="blog-post">
            <h2 class="blog-post-title">{{$article->title}}</h2>
            <p class="blog-post-meta">Posted in <a href="">{{$article->category['name']}}</a> Date: {{date('Y-m-d',strtotime($article->updated_at))}} Tags:
                @foreach($article->tags as $tag)
                    <a href="{{url('tag/'.$tag->id)}}">{{$tag->name}}</a>
                @endforeach
                By: <a href="#">{{ $article->user['name']}}</a></p>
            {!! EndaEditor::MarkDecode($article->content) !!}

        </div><!-- /.blog-post -->
    </div><!-- /.blog-main -->
@endsection