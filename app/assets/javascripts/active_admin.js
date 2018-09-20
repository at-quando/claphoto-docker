//= require active_admin/base

//= require activeadmin/froala_editor/froala_editor.pkgd.min
//= require activeadmin/froala_editor_input
//= require activeadmin/froala_editor/plugins/image.min.js
$(function() {
$('#article_content').froalaEditor({
  imageUploadParam: 'image_param',
  imageUploadURL: '/upload_image',
  imageManagerLoadURL: '/load_image',
  imageManagerDeleteURL: '/delete_image',
  imageUploadParams: {id: 'my_editor'},
  imageUploadMethod: 'POST',
  imageMaxSize: 5 * 1024 * 1024,
  imageAllowedTypes: ['jpeg', 'jpg', 'png']
})
  .on('froalaEditor.image.beforeUpload', function (e, editor, images) {
    console.log(1)
  })
  .on('froalaEditor.image.uploaded', function (e, editor, z) {
    console.log(2)
  })
  .on('froalaEditor.image.inserted', function (e, editor, $img, response) {
    console.log(3)
  })
  .on('froalaEditor.image.replaced', function (e, editor, $img, response) {
    console.log(4)
  })
});