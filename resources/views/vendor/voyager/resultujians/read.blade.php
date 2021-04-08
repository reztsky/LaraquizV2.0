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
                                <span class="badge bg-primary">@{{ posisi_soal }}</span>
                                <span class="badge bg-info">@{{ jumlah_soal }}</span>
                                <span class="badge bg-info">@{{ questions }}</span>
                            </div>
                        </div>
                    </div>
                    <div class="border border-muted rounded-3 p-3 mb-3 alert-warning">
                    <div class="row container">
                        <div class="col-md-12" >
                            <h2 class="display-3 card-title" style="font-family: Adobe Arabic">Paragraph</h2>
                            <div class="card p-3 mb-2 alert-primary">
                                <div class="card-text " v-if="status" v-html="soal[0].paragraph" style="font-family: Adobe Devanagari; font-size: 12pt">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <h2 class="display-6 card-title" style="font-family: Adobe Arabic">Pertanyaan</h2>
                            <div class="card p-3 mb-2 alert-primary">
                                <div class="card-text" v-if="status" v-html="soal[0].question" style="font-family: Adobe Devanagari; font-size: 12pt">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="container">
                            <h2 class="h3 card-title" style="font-family: Adobe Arabic">Jawaban</h2>
                            <ul class="text-dark">
                                <li class="alert alert-warning" v-for="(question,index) in soal" v-html="soal[index].answer">
                                    
                                </li>
                            </ul>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row header-soal">
                        <div class="col-md-8 text-center align-center">
                            <div class="waktu alert bg-primary" role="alert">
                                <span id="duration" class="fw-bold text-light">Waktu Mengerjakan</span>
                            </div>
                        </div>
                        <div class="col-md-4 text-center">
                            <div class="waktu alert bg-primary" role="alert">
                                <span id="duration" class="fw-bold text-light" v-html="total_times"></span>
                            </div>
                        </div>
                    </div>
                    <ol class="daftar-soal p-2 border border-muted rounded-3">
                        @foreach($arrayQuis as $no)
                        <span class="alert alert-info" style="margin-left:10px;"><a href="javascipt:void(0)">{!! $loop->index+1 !!}</a></span>
                        @endforeach
                    </ol>
                    <div class="row">
                        <div class="col-sm-6">
                            <button class="btn btn-sm btn-success" v-on:click="previousSoal()">Soal Sebelumnya</button>
                        </div>
                        <div class="col-sm-6">
                            <button class="btn btn-sm btn-success" v-on:click="nextSoal()">Soal Selanjutanya</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
    <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
    <script>
    new Vue({
        el : '#app',
        data : {
            posisi_soal : 1,
            jumlah_soal : {{count($arrayQuis)}},
            questions   : "{{$nama_quis}}",
            soal        : [],
            status      : false,
            total_times : "{{$total_time}}",
        },
        watch : {},
        methods : {
            getSoal: function(id){
                var url = "{{'/api/question'}}/"+id;
                console.log(url);
                axios
                    .get(url)
                    .then(response => {
                        if(response.data.data.length != 0){
                            this.soal = response.data.data;
                            this.status = true;
                            // console.log(this.soal[0]);
                        }
                        MathJax.typesetPromise().then(() => {
                            // modify the DOM here
                            MathJax.typesetPromise();
                        }).catch((err) => console.log(err.message));
                    })
                    .catch( err => {
                        console.log(err);
                    })
            }
        },
        mounted(){
            this.getSoal({{$arrayQuis[0]}});
        }

    });
    </script>
@stop