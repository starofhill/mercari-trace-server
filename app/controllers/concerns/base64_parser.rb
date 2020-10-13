# frozen_string_literal: true

module Base64Parser
  module_function

  def call(base64:, filename: nil)
    extension = self.create_extension(base64)
    contents = base64.sub(%r/data:((image|application)\/.{3,}),/, "")
    decoded_data = Base64.decode64(contents)
    filename ||= Time.now.strftime("%Y%m%d%H%M%S") + "." + extension
    # File.open("#{Rails.root}/tmp/#{filename}", 'wb') do |f|
    #   f.write(decoded_data)
    # end

    { io: StringIO.new(decoded_data), filename: filename, content_type: get_content_type(extension) }
  end

  def create_extension(base64)
    content_type = rex_image(base64)
    content_type[%r/\b(?!.*\/).*/]
  end

  def rex_image(image)
    image[%r/(image\/[a-z]{3,4})|(application\/[a-z]{3,4})/]
  end

  def get_content_type(extension)
    case extension
    when "jpeg"
      "image/jpeg"
    when "jpg"
      "image/jpeg"
    when "png"
      "image/png"
    else
      raise StandardError
    end
  end
end
