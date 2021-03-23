@extends('voyager::auth.master')

@section('content')
    
    
    <!-- Section 1 -->
    <section class="w-full px-8 py-16 bg-gray-100 xl:px-8">
        <div class="max-w-5xl mx-auto">
            <div class="flex flex-col items-center md:flex-row">

                <div class="w-full space-y-5 md:w-3/5 md:pr-16">
                    <p class="font-medium text-blue-500 uppercase">Building Businesses</p>
                    <h2 class="text-2xl font-extrabold leading-none text-black sm:text-3xl md:text-5xl">
                        Changing The Way People Do Business.
                    </h2>
                    <p class="text-xl text-gray-600 md:pr-16">Learn how to engage with your visitors and teach them about your mission. We're revolutionizing the way customers and businesses interact.</p>
                </div>

                <div class="w-full mt-16 md:mt-0 md:w-2/5">
                    <div class="relative z-10 h-auto p-8 py-10 overflow-hidden bg-white border-b-2 border-gray-300 rounded-lg shadow-2xl px-7">
                        <form action="{{ route('voyager.login') }}" method="POST">
                        {{ csrf_field() }}
                        <h3 class="mb-6 text-2xl font-medium text-center">Sign in to your Account</h3>

                        <input type="text" name="email" id="email" value="{{ old('email') }}" placeholder="{{ __('voyager::generic.email') }}" class="block w-full px-4 py-3 mb-4 border border-2 border-transparent border-gray-200 rounded-lg focus:ring focus:ring-blue-500 focus:outline-none">

                        <input type="password" name="password" class="block w-full px-4 py-3 mb-4 border border-2 border-transparent border-gray-200 rounded-lg focus:ring focus:ring-blue-500 focus:outline-none" placeholder="Password">

                        <div class="block">
                            <button class="w-full px-3 py-4 font-medium text-white bg-blue-600 rounded-lg" type="submit">Log Me In</button>
                        </div>
                        </form>
                        <p class="w-full mt-4 text-sm text-center text-gray-500">Don't have an account? <a href="{{url('/')}}" class="text-blue-500 underline">Sign up here</a></p>
                    </div>
                </div>

            </div>
        </div>
    </section>

    @if(!$errors->isEmpty())
        <div class="alert alert-red">
            <ul class="list-unstyled">
                @foreach($errors->all() as $err)
                    <li>{{ $err }}</li>
                @endforeach
            </ul>
        </div>
    @endif

@endsection

@section('post_js')

    <script>
        var btn = document.querySelector('button[type="submit"]');
        var form = document.forms[0];
        var email = document.querySelector('[name="email"]');
        var password = document.querySelector('[name="password"]');
        btn.addEventListener('click', function(ev){
            if (form.checkValidity()) {
                btn.querySelector('.signingin').className = 'signingin';
                btn.querySelector('.signin').className = 'signin hidden';
            } else {
                ev.preventDefault();
            }
        });
        email.focus();
        document.getElementById('emailGroup').classList.add("focused");

        // Focus events for email and password fields
        email.addEventListener('focusin', function(e){
            document.getElementById('emailGroup').classList.add("focused");
        });
        email.addEventListener('focusout', function(e){
            document.getElementById('emailGroup').classList.remove("focused");
        });

        password.addEventListener('focusin', function(e){
            document.getElementById('passwordGroup').classList.add("focused");
        });
        password.addEventListener('focusout', function(e){
            document.getElementById('passwordGroup').classList.remove("focused");
        });

    </script>
@endsection
