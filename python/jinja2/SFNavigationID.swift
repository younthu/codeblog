// code below generated by template: https://github.wdf.sap.corp/I532140/andrewy-sap
enum SFNavigationID:String {

    {% for navi in ids %}
    // module: {{navi.module}}
    // naviId: {{navi.navigationId}}
    // use case: {{navi.useCase}}
    // user story: {{navi.userStory}}
    case {{(navi.action+navi.entity).replace(".", "_")}} = "{{navi.navigationId}}"
    {% endfor %}
}