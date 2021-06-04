var toolbarOptions = {
	      container : [
	        ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
	        ['blockquote'],
	   
	        [{ 'list': 'ordered'}, { 'list': 'bullet' }],
	        [{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
	        [{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
	        [{ 'direction': 'rtl' }],                         // text direction
	        [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
	         
	        ['link', 'image', 'video', 'formula', 'code-block'],
	        
	        [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
	        [{ 'align': [] }],
	   
	      ]
	   };



  var editor = new Quill('#editor', {
    modules: {
    	imageResize: {},
    	 imageUpload: {
             url: '/fundingRegister_Editer.do',
             method: 'POST',
             name: 'uploadImage',
             withCredentials: false,
             headers: {},

             // 업로드 성공시
             callbackOK: (serverResponse, next) => {
                next(serverResponse);
            },
             
             // 업로드 실패시
             callbackKO: serverError => {
                alert(serverError);
             }
          },
          "toolbar": toolbarOptions ,
    },
    placeholder: '내용을 입력하세요.',

    theme: 'snow',
  });
  
  
  
    $("#submit-btn").on("click", function(){
    	
    	var html = editor.root.innerHTML;
    	$("input[name=projectStory]").val(html);
    	
    	$("#postForm").submit();
    });
   