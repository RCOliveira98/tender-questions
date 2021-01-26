module UsersBackofficeHelper
    def url_avatar(user)
        avatar = user.user_profile.avatar
        avatar.attached? ? avatar : 'avatar-admin.png'
    end

    def name_user(user)
        user.first_name ? user.full_name : user.email 
    end
end
