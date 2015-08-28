class UploadController < ApplicationController
  def index    
    render :file => 'app/views/uploads/uploadfile.html.erb'
  end
  def uploadFile
    # uploaded_file = params[:companies]
    # file_name = uploaded_file.original_filename  
    # File.open(Rails.root.join("public/data/#{uploaded_file.original_filename}"), "wb") do |file|
    #   file.write(uploaded_file.read)
    # end
    # render :index
    post = DataFile.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end

  def cleanup
    @filename = "green2.xlsx"
    File.delete("#{Rails.root}/public/data/#{@filename}") if File.exist?("#{Rails.root}/public/data/#{@filename}")
    redirect_to root_url
  end
end
