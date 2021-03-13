@extends('voyager::master')

@section('content')
<div class="page-content">
        @include('voyager::alerts')
        <link rel="stylesheet" href="{{url('/css/ujian.css')}}">
        <!-- @include('voyager::dimmers') -->
        <div id="app">
            <div class="row">
                <div class="col-md-8">
                    <div class="row header-ujian">
                        <div class="col-md-2">
                            <!-- <div class="jenis-soal alert alert-primary" role="alert"> -->
                                <!-- @{{jenis_soal}} -->
                                    <img src="#" alt="logo adzkia" class="img-thumbnail">
                            <!-- </div> -->
                        </div>
                        <div class="col-md-10 text-center">
                            <div class="waktu alert alert-warning" role="alert">
                                <span class="badge bg-primary">1</span>
                                <span class="badge bg-info">{{ $jumlah_quis }}</span>
                                <span class="badge bg-info">{{ $nama_quis }}</span>
                            </div>
                        </div>
                    </div>
                    <div class="border border-muted rounded-3 p-3 mb-3 alert-warning">
                    <div class="row container">
                        <div class="col-md-12" >
                            <h2 class="display-3 card-title" style="font-family: Adobe Arabic">Paragraph</h2>
                            <div class="card p-3 mb-2 alert-primary">
                                <div class="card-text " v-if="status" style="font-family: Adobe Devanagari; font-size: 12pt">
                                    <p>asdasdas</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <h2 class="display-6 card-title" style="font-family: Adobe Arabic">Pertanyaan</h2>
                            <div class="card p-3 mb-2 alert-primary">
                                <div class="card-text" v-if="status" style="font-family: Adobe Devanagari; font-size: 12pt">
                                    <p>asdasdsad</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="container">
                            <h2 class="h3 card-title" style="font-family: Adobe Arabic">Jawaban</h2>
                            <ul class="text-dark">
                                @for($i=0; $i<=4; $i++)
                                <li class="alert alert-danger">asdasdasdasd</li>
                                @endfor
                            </ul>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row header-soal">
                        <div class="col-md-6 text-center align-center">
                            <div class="waktu alert bg-primary" role="alert">
                                <span id="duration" class="fw-bold text-light">Waktu Mengerjakan</span>
                            </div>
                        </div>
                        <div class="col-md-6 text-center">
                            <div class="waktu alert bg-primary" role="alert">
                                @if($total_times == null)
                                    @{{asdasd}}
                                @else
                                    <span id="duration" class="fw-bold text-light">{{ $total_times }}</span>
                                @endif
                            </div>
                        </div>
                    </div>
                    <ol class="daftar-soal p-2 border border-muted rounded-3">
                        @for($no=1; $no<=$jumlah_quis; $no++)
                            <span class="alert alert-info" style="margin-left:10px;"><a href="javascipt:void(0)">{{ $no }}</a></span>
                        @endfor
                    </ol>
                    <div class="row">
                        <div class="col-sm-4">
                            <button class="btn btn-sm btn-success" v-on:click="previousSoal()">Soal Sebelumnya</button>
                        </div>
                        <div class="col-sm-5">
                            <button class="btn btn-sm btn-success" v-on:click="nextSoal()">Soal Selanjutanya</button>
                        </div>
                        <div class="col-sm-3">
                            <button class="btn btn-sm btn-danger">Selesai</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
    <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
        new Vue({
            el: '#app',
            data: {

            },
            method : {
                nextSoal:function(){
                    alert('sukses');
                },
                previousSoal: function(){
                    alert('sukses');
                }
            },
        });

    </script>
@stop