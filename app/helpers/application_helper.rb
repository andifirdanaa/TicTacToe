module ApplicationHelper
    def current_class?(path)
        return 'active' if request.path == path
        ''
    end

    def self.spread(file)
      case File.extname(file.original_filename)
          when ".csv" then return Roo::CSV.new(file.path, nil, :ignore)
          when ".xls" then return Roo::Excel.new(file.path, nil, :ignore)
          when ".xlsx" then return Roo::Excelx.new(file.path, nil, :ignore)
          else raise "Unknown file type: #{file.original_filename}"
      end
    end

    def self.bulan_indo()
      bln = {
        '01' => 'Januari',
        '02' => 'Februari',
        '03' => 'Maret',
        '04' => 'April',
        '05' => 'Mei',
        '06' => 'Juni',
        '07' => 'Juli',
        '08' => 'Agustus',
        '09' => 'September',
        '10' => 'Oktober',
        '11' => 'November',
        '12' => 'Desember',
      }
      return bln
    end

    def self.req_get(url_path,token)

        url = ENV['CIRACAS_WEB']+url_path

        res = HTTParty.get(
            url, 
            :headers => { 
              'Content-Type' => 'application/json',
              # 'M2TOKEN' => 'M2PAY '+token
            }
          )
        return res.parsed_response
    end

    def self.req_post(url_path,data,token)
        url = ENV['CIRACAS_WEB']+url_path

        res = HTTParty.post(
            url, 
            :body => data,
            :headers => { 
            #   'Content-Type' => 'application/json',
              # 'M2TOKEN' => 'M2PAY '+token
            }
          )
        return res.parsed_response
    end

    def self.req_put(url_path,data,token)
        url = ENV['CIRACAS_WEB']+url_path
        Rails.logger.info "==============> URL : #{url}"

        res = HTTParty.put(
            url, 
            :headers => {
              # 'Content-Type' => 'application/json',
              # 'M2TOKEN' => 'M2PAY '+token
            },
            :body => data
          )
        return res.parsed_response
    end

    def self.req_del(url_path,data,token)
        url = ENV['CIRACAS_WEB']+url_path
        Rails.logger.info "==============> URL : #{url}"

        res = HTTParty.delete(
            url, 
            :headers => {
              # 'Content-Type' => 'application/json',
              # 'M2TOKEN' => 'M2PAY '+token
            },
            :body => data
          )
        return res.parsed_response
    end
end
