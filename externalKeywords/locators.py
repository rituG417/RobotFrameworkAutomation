import json
import jsonpath

def read_locator_from_json(locatorname):
    f = open('C:/Users/ritu.garg/PycharmProjects/AutomationDay1/jsonFile/elements.json')
    response = json.loads(f.read())
    value = jsonpath.jsonpath(response, locatorname)
    return value[0]