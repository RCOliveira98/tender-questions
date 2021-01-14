module AdminsBackofficeHelper
    def t_attributes(object = nil, method = nil)
        object && method ? object.model.human_attribute_name(method) : 'Parâmetros não enviados para tradução'
    end
end
