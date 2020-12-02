class PetApi
    def pet_get_idi(id_pet)
        url = URI"#{ENV['BASE_URI']}/pet/#{id_pet}"
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true
        request = Net::HTTP::Get.new(url)
        response = https.request(request)
        return response.read_body
    end
    def pet_add(body)
        uri = "#{ENV['BASE_URI']}/pet"
        return without_authentication('post', uri, body.to_json)
    end
    
    def pet_get_id(id_pet)
        uri = "#{ENV['BASE_URI']}/pet/#{id_pet}"
        return without_authentication('get', uri)
    end

    def pet_get_status(status_pet)
        uri = "#{ENV['BASE_URI']}/pet/findByStatus?status=#{status_pet}"
        return without_authentication('get', uri)
    end
    
    def pet_update_id(pet_id, name, staus_new )
        uri = "#{ENV['BASE_URI']}/pet/#{pet_id}"
        body = "name=#{name}&status=#{staus_new}"
        return without_authentication('post', uri, body, 'application/x-www-form-urlencoded')
    end

    def pet_updare_put(body)
        uri = "#{ENV['BASE_URI']}/pet"
        return without_authentication('put', uri, body.to_json)
    end

    def delete_pet_id(pet_id)
        uri = "#{ENV['BASE_URI']}/pet/#{pet_id}"
        return without_authentication('delete', uri)
    end
end