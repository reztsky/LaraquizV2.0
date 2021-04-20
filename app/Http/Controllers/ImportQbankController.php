<?php

namespace App\Http\Controllers;

use App\Option;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use PhpOffice\PhpWord\PhpWord;
use PhpOffice\PhpWord\IOFactory;
use PhpOffice\PhpWord\Element\TextRun;
use PhpOffice\PhpWord\Element\Text;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Qbank;

class ImportQbankController extends Controller
{
    
    public function __construct(){
        $this->phpWord = new PhpWord();
       
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'Qbank'   => 'mimes:docx'
        ]);
        
        $question_type = $request->Post('QustionOptions');
        $question_category = $request->Post('CategoryName');
        // echo $question_options.'<br>';
        // echo $question_category;

        $filenameWithExt = $request->file('Qbank')->getClientOriginalName();
        $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
        $extension = $request->file('Qbank')->getClientOriginalExtension();
        $filenameSave = $filename.'_'.time().'.'.$extension;
        $path = $request->file('Qbank')->storeAs('public/QbankFile', $filenameSave);

        if($path){

            $xmlString = '';
            try{

                $contentWord = $this->readDocx($filenameSave, $extension);
                $xmlString = html_entity_decode($contentWord);
                return view('importSoal',compact('xmlString','question_type','question_category'));
                
            }catch(Exception $e){
                return back()
                ->with('message','File upload error '.$e);
            }
        }
    }


    public function saveSoal(Request $request){
        $Qbanks=json_decode($request->post('json'));
        $question_type = $request->Post('question_type');
        $question_category = $request->Post('question_category');
        
        foreach($Qbanks as $row){
            $qbanks=Qbank::create([
                'question_type' => $question_type,
                'question'      => '<p>'.$row->question.'</p>',
                'inserted_by'   => Auth::user()->id,
                'paragraph'     => $row->paragraph,
                'id_category'   => $question_category
            ]);
            foreach($row->options as $rowoptions){
                $insertOptions = Option::create([
                    'idq'       => $qbanks->id,
                    'answer'    => '<p>'.$rowoptions->answer.'</p>',
                    'score'     => $rowoptions->score
                ]);
            }
        }

        if($qbanks&&$insertOptions){
            echo "1";
        }else{
            echo "0";
        }
    }

    public function readDocx($fileName, $extn)
    {
        if($extn == "docx"){
            $source = storage_path('app\public\QbankFile/'.$fileName);
            //dd($source);
            $objReader = IOFactory::createReader('Word2007');
            $phpWord = $objReader->load($source);
            $body = '';
            
            foreach ($phpWord->getSections() as $section) {
                $arrays = $section->getElements();
                foreach ($arrays as $e) {
                    if(get_class($e) === 'PhpOffice\PhpWord\Element\TextBreak'){
                        $body .= '';
                    }else if(get_class($e) === 'PhpOffice\PhpWord\Element\TextRun') {
                        foreach($e->getElements() as $text) {
                            $body .= $text->getText();
                        }
                    } else if(get_class($e) === 'PhpOffice\PhpWord\Element\Text'){
                        $body .= $e->getText();
                    } else if(get_class($e) === 'PhpOffice\PhpWord\Element\Image'){
                        $body .= '<div style="width:200px;height:150px; background:red;"></div>';
                    } else if(get_class($e) === 'PhpOffice\PhpWord\Element\Table') {
                        $body .= '<table border="2px">';
                        
                        $rows = $e->getRows();
                        
                        foreach($rows as $row) {
                            $body .= '<tr>';
                            $cells = $row->getCells();
                            foreach($cells as $cell) {
                                $body .= '<td style="width:'.$cell->getWidth().'">';
                                $celements = $cell->getElements();
                                foreach($celements as $celem) {
                                    if(get_class($celem) === 'PhpOffice\PhpWord\Element\Text') {
                                        $body .= $celem->getText();
                                    }
                                    
                                    else if(get_class($celem) === 'PhpOffice\PhpWord\Element\TextRun') {
                                        foreach($celem->getElements() as $text) {
                                            $body .= $text->getText();
                                        }  
                                    }
                                } 
                                $body .= '</td>';
                            }
                            $body .= '</tr>';
                        }
                        $body .= '</table>';
                    } else if (get_class($e)==='PhpOffice\PhpWord\Element\ListItem'){
                        $list = new \PhpOffice\PhpWord\Style\ListItem();
                        $listType .= $list->getListType();
                        if($listType === 7) {
                            $lts = '<ol>';
                            $lte = '</ol>';
                        }
                        else if($listType === 3) {
                            $lts = '<ul>';
                            $lte = '</ul>';
                        }
                            $body .='<ul style="font-size:14px; color:black; font-family:Times-New-Roman;>';
                            $ee = 'PhpOffice\PhpWord\Element\ListItem';
                            $obj = $e->getTextObject();
                                $body .='<li style="color:'.$color.';">';
                                if(get_class($obj)==='PhpOffice\PhpWord\Element\Text'){
                                    $body .=$obj->getText();
                                }
                            $body .='</li>';
                            $body .='</ul>';
                    }
                }
                break;
            }  
        }
        return $body;
    }

    public function download()
    {
        $file = storage_path()."/app/templateQbank.docx";
        return response()->download($file, 'templateQbank.docx');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
