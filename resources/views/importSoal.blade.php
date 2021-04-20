<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
</head>
<body>
    {{$xmlString}}
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            var dataQbanks= new Array();
            function getHtml(){
                var body=$("body").html();
                var xml=$.parseHTML(body);
                var data=$.parseHTML(xml[0]['data']);
                
                return data;
            }

            function parseHtmlToXml(xml){
                var parser = new DOMParser();
                var xmlcontainer=xml[1];

                $(xmlcontainer).find("qbanks").each(function(){
                    var qbanks=$(this);
                    dataQbanks.push({
                        question:$(qbanks).find("question").text(),
                        paragraph:$(qbanks).find("paragraph").text(),
                        options:getOptions(qbanks)
                    });
                });

                function getOptions(qbanks){
                    var option=new Array();
                    $(qbanks).find("options").each(function(){
                        option.push({
                            score:$(this).find("score").text(),
                            answer:$(this).find("answer").text()
                        });
                    });
                    return option;
                }               
            }

            function sendArrayQbanks(dataQbanks){
                $.ajax({
                    headers: {
                        "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
                    },
                    url:"{{url('importSoal')}}",
                    type:"POST",
                    dataType:"json",
                    data:{"json":JSON.stringify(dataQbanks),"question_type":{{ $question_type }},"question_category":{{ $question_category }} },
                    success:function(result){
                        if(result==1){
                            window.location.href="{{url('/tryout/qbanks')}}";
                        }else{
                            alert('Failed Add Question Banks');
                            window.location.href="{{url('/tryout/qbanks')}}";
                        }
                    }
                });
            }
            var xmlData=getHtml();
            parseHtmlToXml(xmlData);
            sendArrayQbanks(dataQbanks);
        </script>
</html>