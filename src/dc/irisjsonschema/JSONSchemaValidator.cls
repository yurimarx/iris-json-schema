/// Validate JSON documents using JSON Schema documents
Class dc.irisjsonschema.JSONSchemaValidator
{

/// Get json and json schema em return validation results
ClassMethod Validate(JSONSchemaContent As %String, JSONContent As %String, Output ValidationResult As %String) As %Status
{
    Set sc = $$$OK

    // Connect a Gateway instance to server JavaGateway on the host machine
    set GW = ##class(%Net.Remote.Gateway).%New()
    set st = GW.%Connect("jgw", "55555", "IRISAPP",,) 
    //instantiate java class
    set JSONSchemaValidator = ##class(%Net.Remote.Object).%New(GW,"dc.irisjsonschema.JSONSchemaService")
    //validate the JSON using a JSON Schema
    set ValidationResult = JSONSchemaValidator.validate(JSONSchemaContent, JSONContent)
    
    Write ValidationResult

    Return sc
}

/// Get Valid Sample JSON
ClassMethod GetValidSampleJSON() As %String
{
    set obj = {}
    set obj.name = "Agent 007"
    set obj.artist = "Pierce Brosman"
    set obj.description = "007 actor"
    set tags = ["license","kill"]
    set obj.tags = tags

    return obj.%ToJSON()
}

/// Get Valid Sample JSON
ClassMethod GetInvalidSampleJSON() As %String
{
    set obj = {}
    set obj.name = "Agent 007"
    set obj.artist = "Pierce Brosman"
    set obj.description = 1
    set tags = []
    set tags."0" = "license" 
    set tags."1" = "kill"
    set obj.tags = tags

    return obj.%ToJSON()
}

/// Get Valid Sample JSON
ClassMethod GetJSONSchema() As %String
{
    set obj = {
        "$schema": "https://json-schema.org/draft/2019-09/schema#",
        "type": "object",
        "title": "Movie art",
        "description": "Information about actors",
        "additionalProperties": true,
        "required": ["name","artist","description","tags"],
        "properties": {
            "name": {
                "type": "string",
                "description": "Painting name"
            },
            "artist": {
                "type": "string",
                "maxLength": 50,
                "description": "Name of the artist"
            },
            "description": {
                "type": [
                    "string",
                    "null"
                ],
                "description": "Painting description"
            },
            "tags": {
                "type": "array",
                "items": {
                    "$ref": "#/$defs/tag"
                }
            }
        },
        "$defs": {
            "tag": {
                "type": "string",
                "enum": [
                    "action",
                    "suspense",
                    "UK",
                    "famous",
                    "license",
                    "kill"
                ]
            }
        }
    }
  
    return obj.%ToJSON()
}

}
