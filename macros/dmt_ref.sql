{% macro ref(model_name) %}
    {% if var('dmt_test_suite', '') != '' %}
        {% set mapping_dict = "var('dmt_mappings')[var('dmt_test_suite')]['refs']" %}
        {% if model_name in eval(mapping_dict) %}
            {% do return(builtins.ref(eval(mapping_dict)[model_name])) %}
        {% endif %}
    {% endif %}

    {% do return(builtins.ref(model_name)) %}
{% endmacro %}