@extends('ujianAttempt.layoutUjian')
@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-2">
            <img src="#" alt="logo adzika">
        </div>
        <div class="col-8">
            <h1 class="text-center">Nama Ujian</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-6">
            <h1 class="text-center">Paragraf</h1>
        </div>
        <div class="col-6">
            <ul class="pagination">
                <li class="page-item">1</li>
                <li class="page-item">2</li>
                <li class="page-item">3</li>
                <li class="page-item">4</li>
                <li class="page-item">5</li>
                <li class="page-item">6</li>
                <li class="page-item">7</li>
                <li class="page-item">8</li>
                <li class="page-item">9</li>
                <li class="page-item">10</li>
            </ul>
        </div>
        <div class="row">
            <div class="col-6">
                <h1 class="text-center">Soal</h1>
            </div>
        </div>
    </div>
</div>
@endsection