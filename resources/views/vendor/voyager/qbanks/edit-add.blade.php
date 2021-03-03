@php
    $edit = !is_null($dataTypeContent->getKey());
    $add  = is_null($dataTypeContent->getKey());
    use App\Category;
@endphp

@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop

@section('page_title', __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
        {{ __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular') }}
    </h1>
    @include('voyager::multilingual.language-selector')
    <button class="btn btn-primary" data-toggle="modal" data-target="#importQuisModal">Import Quis</button>
    <a href="{{ url('template-download') }}" class="btn btn-success">Download Template Qbank</a>

@stop

<script>
    if(typeof M === "undefined") M = {};
    M.mathslateURL = M.mathslateURL || document.location.toString().replace(/\/[^/]*$/, '/plugins/mathslate');
    
 </script>
<div class="modal fade" id="importQuisModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form action="{{ url('uploadQbank') }}" method="POST" enctype="multipart/form-data">
            {{ csrf_field() }}
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="importQuisModal">Import Quis From Word Format</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                @php
                    $dataTypeRows = $dataType->{($edit ? 'editRows' : 'addRows' )};
                    $nama_category = Category::all();
                @endphp

                <div class="row" style="margin-left: 0px">
                    <div class="col-12">
                        <label>Category</label></br>
                        <select class="js-example-basic-single" name="CategoryName" style="width: 97.5%">
                            @foreach($nama_category as $options)
                                <option value="{{ $options->id }}">{{ $options->category_name }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="row" style="margin-left: 0px">
                    <div class="col-12">
                        <label>Question Options</label></br>
                        <select class="js-example-basic-single" name="QustionOptions" style="width: 97.5%">
                            <option value="1">Multiple Choice Single Answer</option>
                            <option value="2">Multiple Choice Multiple Answer</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="importquiz">Select Quiz File (.docx)</label>
                    <input type="file" class="form-control" name="Qbank">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
            </div>
        </form>
    </div>
</div>

@section('content')
    <div class="page-content edit-add container-fluid">

    @if (count($errors) > 0)
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                  <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    @if(session()->has('success'))
        <div class="alert alert-success">
            {{ session()->get('success') }}
        </div>
    @endif

    @if(session()->has('pesan'))
        <div class="alert alert-success">
            {{ session()->get('pesan') }}
        </div>
    @endif
        <div class="row">
            <div class="col-md-12">
                <!-- form start -->
                @if ($edit)
                    <div class="panel panel-bordered">
                        <!-- form start -->
                        <form role="form"
                                class="form-edit-add"
                                action="{{ $edit ? route('voyager.'.$dataType->slug.'.update', $dataTypeContent->getKey()) : route('voyager.'.$dataType->slug.'.store') }}"
                                method="POST" enctype="multipart/form-data">
                            <!-- PUT Method if we are editing -->
                            @if($edit)
                                {{ method_field("PUT") }}
                            @endif
                
                            <!-- CSRF TOKEN -->
                            {{ csrf_field() }}
                            <div class="col-md-6 col-xl-6" id="edit_soal">
                                <div class="panel-body">

                                    <!-- @if (count($errors) > 0)
                                        <div class="alert alert-danger">
                                            <ul>
                                                @foreach ($errors->all() as $error)
                                                    <li>{{ $error }}</li>
                                                @endforeach
                                            </ul>
                                        </div>
                                    @endif -->
                    
                                    <!-- Adding / Editing -->
                                    @php
                                        $dataTypeRows = $dataType->{($edit ? 'editRows' : 'addRows' )};
                                    @endphp
                    
                                    @foreach($dataTypeRows as $row)
                                        <!-- GET THE DISPLAY OPTIONS -->
                                        @php
                                            $display_options = $row->details->display ?? NULL;
                                            if ($dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')}) {
                                                $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')};
                                            }
                                        @endphp
                                        @if (isset($row->details->legend) && isset($row->details->legend->text))
                                            <legend class="text-{{ $row->details->legend->align ?? 'center' }}" style="background-color: {{ $row->details->legend->bgcolor ?? '#f0f0f0' }};padding: 5px;">{{ $row->details->legend->text }}</legend>
                                        @endif
                    
                                        <div class="form-group @if($row->type == 'hidden') hidden @endif col-md-{{ $display_options->width ?? 12 }} {{ $errors->has($row->field) ? 'has-error' : '' }}" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
                                            @if ($row->getTranslatedAttribute('display_name')!="users")
                                                <label class="control-label" for="name">{{ $row->getTranslatedAttribute('display_name') }}</label>    
                                            @endif
                                            
                                            @include('voyager::multilingual.input-hidden-bread-edit-add')
                                            @if (isset($row->details->view))
                                                @include($row->details->view, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'action' => ($edit ? 'edit' : 'add'), 'view' => ($edit ? 'edit' : 'add'), 'options' => $row->details])
                                            @elseif ($row->type == 'relationship')
                                                @if ($row->getTranslatedAttribute('display_name')!="users")
                                                    @include('voyager::formfields.relationship', ['options' => $row->details]) 
                                                @else
                                                    <input type="hidden" name="inserted_by" value="{{Auth::user()->id}}">
                                                @endif
                                            @else
                                                {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                                            @endif
                    
                                            @foreach (app('voyager')->afterFormFields($row, $dataType, $dataTypeContent) as $after)
                                                {!! $after->handle($row, $dataType, $dataTypeContent) !!}
                                            @endforeach
                                            @if ($errors->has($row->field))
                                                @foreach ($errors->get($row->field) as $error)
                                                    <span class="help-block">{{ $error }}</span>
                                                @endforeach
                                            @endif
                                        </div>
                                    @endforeach
                                
                                </div><!-- panel-body -->
                            </div>
                            <div class="col-md-6 col-xl-6" id="options">
                                @php
                                    $dataTypeRows = $dataType_options->{($edit ? 'editRows' : 'addRows' )};
                                @endphp
                                @foreach ($dataTypeContent_options as $item)
                                    @foreach ($dataTypeRows as $row)
                                       
                                        @if (isset($row->details->legend) && isset($row->details->legend->text))
                                            <legend class="text-{{ $row->details->legend->align ?? 'center' }}" style="background-color: {{ $row->details->legend->bgcolor ?? '#f0f0f0' }};padding: 5px;">{{ $row->details->legend->text }}</legend>
                                        @endif
                                        @if ($row->getTranslatedAttribute('display_name')=="Idq")
                                            
                                        @else
                                            <div class="form-group @if($row->type == 'hidden') hidden @endif col-md-{{ $display_options->width ?? 12 }} {{ $errors->has($row->field) ? 'has-error' : '' }}" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
                                                {{ $row->slugify }}
                                                @if($row->type != 'relationship')
                                                    <label class="control-label" for="name">{{ $row->getTranslatedAttribute('display_name') }}</label>
                                                @endif
                                                @include('voyager::multilingual.input-hidden-bread-edit-add')
                                                @if (isset($row->details->view))
                                                    @include($row->details->view, ['row' => $row, 'dataType' => $dataType_options, 'dataTypeContent' => $item, 'content' => $item->{$row->field}, 'action' => ($edit ? 'edit' : 'add'), 'view' => ($edit ? 'edit' : 'add'), 'options' => $row->details])
                                                @elseif ($row->type == 'relationship')
                                                    @if ($row->getTranslatedAttribute('display_name')!="qbanks")

                                                    @else
                                                        <input type="hidden" name="idoptions[]" value="{{$item->id}}">
                                                    @endif
                                                @else
                                                    {!! app('voyager')->formField($row, $dataType_options, $item) !!}
                                                @endif

                                                @foreach (app('voyager')->afterFormFields($row, $dataType_options, $item) as $after)
                                                    {!! $after->handle($row, $dataType_options, $item) !!}
                                                @endforeach
                                                @if ($errors->has($row->field))
                                                    @foreach ($errors->get($row->field) as $error)
                                                        <span class="help-block">{{ $error }}</span>
                                                    @endforeach
                                                @endif
                                            </div>
                                        @endif
                                    @endforeach
                                @endforeach
                            </div>
                
                            <div class="panel-footer">
                                @section('submit-buttons')
                                    <button type="submit" class="btn btn-primary save">{{ __('voyager::generic.save') }}</button>
                                @stop
                                @yield('submit-buttons')
                            </div>
                        </form>
                
                        <iframe id="form_target" name="form_target" style="display:none"></iframe>
                        <form id="my_form" action="{{ route('voyager.upload') }}" target="form_target" method="post"
                                enctype="multipart/form-data" style="width:0;height:0;overflow:hidden">
                            <input name="image" id="upload_file" type="file"
                                    onchange="$('#my_form').submit();this.value='';">
                            <input type="hidden" name="type_slug" id="type_slug" value="{{ $dataType->slug }}">
                            {{ csrf_field() }}
                        </form>
                
                    </div> 
                @else
                    <form role="form" class="form-edit-add" action="{{ $edit ? route('voyager.'.$dataType->slug.'.update', $dataTypeContent->getKey()) : route('voyager.'.$dataType->slug.'.store') }}" method="POST" enctype="multipart/form-data" id="form_questions">
                        <!-- PUT Method if we are editing -->
                        @if($edit)
                            {{ method_field("PUT") }}
                        @endif
                
                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}
                
                        <div class="col-md-6 col-xl-6 panel panel-bordered" id="container-soal">
                            <div class="panel-header"><p class="h3">Question</p></div>
                            <div class="panel-body" id="soal">
                                
                                <!-- @if (count($errors) > 0)
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach ($errors->all() as $error)
                                                <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                @endif -->

                                <!-- Adding / Editing -->
                                @php
                                    $dataTypeRows = $dataType->{($edit ? 'editRows' : 'addRows' )};
                                @endphp

                                @foreach($dataTypeRows as $row)
                                    <!-- GET THE DISPLAY OPTIONS -->
                                    @php
                                        $display_options = $row->details->display ?? NULL;
                                        if ($dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')}) {
                                            $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')};
                                        }
                                    @endphp
                                    @if (isset($row->details->legend) && isset($row->details->legend->text))
                                        <legend class="text-{{ $row->details->legend->align ?? 'center' }}" style="background-color: {{ $row->details->legend->bgcolor ?? '#f0f0f0' }};padding: 5px;">{{ $row->details->legend->text }}</legend>
                                    @endif

                                    <div class="form-group @if($row->type == 'hidden') hidden @endif col-md-{{ $display_options->width ?? 12 }} {{ $errors->has($row->field) ? 'has-error' : '' }}" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
                                        {{ $row->slugify }}
                                        @if ($row->getTranslatedAttribute('display_name')!="users")
                                            <label class="control-label" for="name">{{ $row->getTranslatedAttribute('display_name') }}</label>
                                        @else
                                            <input type="hidden" name="inserted_by" value="{{Auth::user()->id}}">
                                        @endif
                                        
                                        @include('voyager::multilingual.input-hidden-bread-edit-add')
                                        @if (isset($row->details->view))
                                            @include($row->details->view, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'action' => ($edit ? 'edit' : 'add'), 'view' => ($edit ? 'edit' : 'add'), 'options' => $row->details])
                                        @elseif ($row->type == 'relationship')
                                            @if ($row->getTranslatedAttribute('display_name')!="users")
                                                @include('voyager::formfields.relationship', ['options' => $row->details]) 
                                            @endif
                                        @else
                                            {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                                        @endif

                                        @foreach (app('voyager')->afterFormFields($row, $dataType, $dataTypeContent) as $after)
                                            {!! $after->handle($row, $dataType, $dataTypeContent) !!}
                                        @endforeach
                                        @if ($errors->has($row->field))
                                            @foreach ($errors->get($row->field) as $error)
                                                <span class="help-block">{{ $error }}</span>
                                            @endforeach
                                        @endif
                                    </div>
                                @endforeach
                            </div> 
                        </div>
                        <div class="col-md-6 col-xl-6" id="options">
                            <div class="panel-header"><p class="h3">Options</p></div>
                            <div class="panel-body">
                                <!-- @if (count($errors) > 0)
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach ($errors->all() as $error)
                                                <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                @endif -->

                                <!-- Adding / Editing -->
                                @php
                                    $dataTypeRows = $dataType_options->{($edit ? 'editRows' : 'addRows' )};
                                @endphp
                                <div class="content_options" id="content_options">
                                    @foreach($dataTypeRows as $row)
                                        <!-- GET THE DISPLAY OPTIONS -->
                                        @php
                                            $display_options = $row->details->display ?? NULL;
                                            if ($dataTypeContent_options->{$row->field.'_'.($edit ? 'edit' : 'add')}) {
                                                $dataTypeContent_options->{$row->field} = $dataTypeContent_options->{$row->field.'_'.($edit ? 'edit' : 'add')};
                                            }
                                        @endphp
                                        @if (isset($row->details->legend) && isset($row->details->legend->text))
                                            <legend class="text-{{ $row->details->legend->align ?? 'center' }}" style="background-color: {{ $row->details->legend->bgcolor ?? '#f0f0f0' }};padding: 5px;">{{ $row->details->legend->text }}</legend>
                                        @endif
                                        
                                        @if ($row->getTranslatedAttribute('display_name')=="Idq")
                                            
                                        @else
                                            <div class="form-group @if($row->type == 'hidden') hidden @endif col-md-{{ $display_options->width ?? 12 }} {{ $errors->has($row->field) ? 'has-error' : '' }}" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
                                                {{ $row->slugify }}
                                                @if($row->type != 'relationship')
                                                    <label class="control-label" for="name">{{ $row->getTranslatedAttribute('display_name') }}</label>
                                                @endif
                                                @include('voyager::multilingual.input-hidden-bread-edit-add')
                                                @if (isset($row->details->view))
                                                    @include($row->details->view, ['row' => $row, 'dataType' => $dataType_options, 'dataTypeContent' => $dataTypeContent_options, 'content' => $dataTypeContent_options->{$row->field}, 'action' => ($edit ? 'edit' : 'add'), 'view' => ($edit ? 'edit' : 'add'), 'options' => $row->details])
                                                @elseif ($row->type == 'relationship')
                                                    
                                                @else
                                                    {!! app('voyager')->formField($row, $dataType_options, $dataTypeContent_options) !!}
                                                @endif

                                                @foreach (app('voyager')->afterFormFields($row, $dataType_options, $dataTypeContent_options) as $after)
                                                    {!! $after->handle($row, $dataType_options, $dataTypeContent_options) !!}
                                                @endforeach
                                                @if ($errors->has($row->field))
                                                    @foreach ($errors->get($row->field) as $error)
                                                        <span class="help-block">{{ $error }}</span>
                                                    @endforeach
                                                @endif
                                            </div>
                                        @endif
                                    @endforeach 
                                </div> 
                            </div>
                            <div id="container_answer_add" class="container_answer_add"></div> 
                            <div class="panel-footer">
                                @if(!$edit)
                                <button class="btn btn-success" id="add_answer" type="button">Add Options</button>
                                @endif
                                @section('submit-buttons')
                                    <button type="submit" class="btn btn-primary save">{{ __('voyager::generic.save') }}</button>
                                @stop
                                @yield('submit-buttons')
                            </div>
                        </div>
                    </form>
                @endif
            </div>
        </div>
    </div>
    
    <iframe id="form_target1" name="form_target" style="display:none"></iframe>
    <form id="my_form1" action="{{ route('voyager.upload') }}" target="form_target" method="post"
            enctype="multipart/form-data" style="width:0;height:0;overflow:hidden">
        <input name="image" id="upload_file1" type="file"
                    onchange="$('#my_form1').submit();this.value='';">
        <input type="hidden" name="type_slug" id="type_slug1" value="{{ $dataType_options->slug }}">
        {{ csrf_field() }}
    </form>
    <div class="modal fade modal-danger" id="confirm_delete_modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="voyager-warning"></i> {{ __('voyager::generic.are_you_sure') }}</h4>
                </div>

                <div class="modal-body">
                    <h4>{{ __('voyager::generic.are_you_sure_delete') }} '<span class="confirm_delete_name"></span>'</h4>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                    <button type="button" class="btn btn-danger" id="confirm_delete">{{ __('voyager::generic.delete_confirm') }}</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Delete File Modal -->
@stop

@section('javascript')
    <script>
        
        var params = {};
        var $file;
        
        function deleteHandler(tag, isMulti) {
          return function() {
            $file = $(this).siblings(tag);

            params = {
                slug:   '{{ $dataType->slug }}',
                filename:  $file.data('file-name'),
                id:     $file.data('id'),
                field:  $file.parent().data('field-name'),
                multi: isMulti,
                _token: '{{ csrf_token() }}'
            }

            $('.confirm_delete_name').text(params.filename);
            $('#confirm_delete_modal').modal('show');
          };
        }
        
        function create_tinymce(id){
            var additionalConfig = {
                selector: 'textarea#'+id,
                min_height:150
            }
            $.extend(additionalConfig, {!! json_encode($options->tinymceOptions ?? '{}') !!})

            tinymce.init(window.voyagerTinyMCE.getConfig(additionalConfig));
            //tinymce.execCommand("mceAddControl", false, 'textarea#'+id);
        }
        
        //var tinymce=tinymce.get('mathjxeditor');

        $('document').ready(function () {
            $(document).on('click','input[type=checkbox]', function() {
                $('input[type=checkbox]').not(this).prop('checked', false);
            });

            $('.js-example-basic-single').select2();

            var op=0;
            
            $('.panel-footer').on('click','#add_answer',function(){
                
                //tinymce.remove();
                var editor_id='richtextbox0';
                //console.log(editor_id);
                //tinymce.EditorManager.execCommand('mceRemoveEditor',true, editor_id);
                tinymce.get(editor_id).remove();

                op+=1;
                

                var content_option=$('#content_options').html();
                //tinymce.EditorManager.execCommand('mceAddEditor',true, editor_id);
                create_tinymce(editor_id);
                
                var txtarea='richtextbox'+op;
                var check='correct_answer['+op+']';
                var hidden='correct_answer['+op+']';

                $('#container_answer_add').append(content_option);

                $('.richTextBox').last().attr('id',txtarea);
                $('.checkbox_answer').last().attr('name',check);
                $('.hidden_check').last().attr('name',check);

                var id=$('.richTextBox').last().attr('id');
                
                create_tinymce(id);
            });

            $('.toggleswitch').bootstrapToggle();

            //Init datepicker for date fields if data-datepicker attribute defined
            //or if browser does not handle date inputs
            $('.form-group input[type=date]').each(function (idx, elt) {
                if (elt.hasAttribute('data-datepicker')) {
                    elt.type = 'text';
                    $(elt).datetimepicker($(elt).data('datepicker'));
                } else if (elt.type != 'date') {
                    elt.type = 'text';
                    $(elt).datetimepicker({
                        format: 'L',
                        extraFormats: [ 'YYYY-MM-DD' ]
                    }).datetimepicker($(elt).data('datepicker'));
                }
            });

            @if ($isModelTranslatable)
                $('.side-body').multilingual({"editing": true});
            @endif

            $('.side-body input[data-slug-origin]').each(function(i, el) {
                $(el).slugify();
            });

            $('.form-group').on('click', '.remove-multi-image', deleteHandler('img', true));
            $('.form-group').on('click', '.remove-single-image', deleteHandler('img', false));
            $('.form-group').on('click', '.remove-multi-file', deleteHandler('a', true));
            $('.form-group').on('click', '.remove-single-file', deleteHandler('a', false));

            $('#confirm_delete').on('click', function(){
                $.post('{{ route('voyager.'.$dataType->slug.'.media.remove') }}', params, function (response) {
                    if ( response
                        && response.data
                        && response.data.status
                        && response.data.status == 200 ) {

                        toastr.success(response.data.message);
                        $file.parent().fadeOut(300, function() { $(this).remove(); })
                    } else {
                        toastr.error("Error removing file.");
                    }
                });

                $('#confirm_delete_modal').modal('hide');
            });
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
@stop
