@extends('voyager::master')

@section('content')
<div class="page-content">
        @include('voyager::alerts')
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
                        <div class="col-md-4 text-center align-center">
                            <div class="waktu alert bg-primary" role="alert">
                                <span id="duration" class="fw-bold text-light">Sisa Waktu</span>
                            </div>
                        </div>
                        <div class="col-md-8 text-center">
                            <div class="waktu alert bg-primary" role="alert">
                                <span id="duration" class="fw-bold text-light">123</span>
                            </div>
                        </div>
                    </div>
                    <ul class="daftar-soal alert-warning p-2 border border-muted rounded-3">
                        @php $no=1; @endphp
                        @for(;$no<=$jumlah_quis;)
                            <li>{{ $no+1 }}</li>
                        @endfor
                    </ul>
                    <div class="row">
                        <div class="col-sm-4">
                            <button class="btn btn-sm btn-success">Soal Sebelumnya</button>
                        </div>
                        <div class="col-sm-5">
                            <button class="btn btn-sm btn-success">Soal Selanjutanya</button>
                        </div>
                        <div class="col-sm-3">
                            <button class="btn btn-sm btn-danger">Selesai</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop