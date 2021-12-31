module RedisHelper
    def self.construct_cache_key(key)
        Digest::MD5.hexdigest(key)
    end

    def self.get(key)
        response = $redis.get(key) rescue nil
        Rails.logger.info "##################### GET CACHE key : #{key} result is #{response.present?} #######################"
        return response
    end

    def self.set(key, value)
        Rails.logger.info "##################### SET CACHE key : #{key} #######################"
        $redis.set(key, value)
    end

    def self.set_expire(key, seconds)
        Rails.logger.info "##################### SET EXPIRE FOR CACHE key : #{key} IN #{seconds} SECONDS #######################"
        $redis.expire(key, seconds)
    end

    def self.delete(key)
        Rails.logger.info "##################### DELETE CACHE key : #{key} #######################"
        $redis.del(key)
    end

    def self.delete_by_namespace(namespace)
        Rails.logger.info "##################### DELETE CACHE key by namespace : #{namespace} #######################"
        keys = $redis.keys "#{namespace}*"
        Rails.logger.info "##### keys : #{keys} #####"
        $redis.del(*keys) unless keys.empty?
    end
end
